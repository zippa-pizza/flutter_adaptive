import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_adaptive/platform.dart';

/// Shows a dialog
Future<T?> showDialog<T>({
  required BuildContext context,
  required List<DialogAction> actions,
  String? title,
  String? content,
  bool? barrierDismissible,
}) {
  if (context.isIOS) {
    return showCupertinoDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (dialogContext) {
        return CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: content != null ? Text(content) : null,
          actions: actions.map((action) {
            return CupertinoDialogAction(
              onPressed: () => action.onPressed?.call(dialogContext),
              isDefaultAction: action.isPrimary,
              isDestructiveAction: action.isDestructive,
              child: Text(action.title),
            );
          }).toList(),
        );
      },
    );
  }

  return material.showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible ?? true,
    builder: (dialogContext) {
      return material.AlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actionsOverflowButtonSpacing: 8,
        actions: actions.map((action) {
          return material.Theme(
            data: material.Theme.of(context).copyWith(
              textButtonTheme: material.TextButtonThemeData(
                style:
                    material.Theme.of(context).textButtonTheme.style!.copyWith(
                          padding: material.MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                          ),
                        ),
              ),
            ),
            child: adaptive.Button(
              foregroundColor: !action.isPrimary
                  ? material.Theme.of(context)
                      .textButtonTheme
                      .style!
                      .backgroundColor!
                      .resolve({material.MaterialState.selected})
                  : null,
              backgroundColor:
                  !action.isPrimary ? material.Colors.transparent : null,
              onPressed: () => action.onPressed?.call(dialogContext),
              child: Text(action.title, textAlign: TextAlign.end),
            ),
          );
        }).toList(),
      );
    },
  );
}

class DialogAction {
  final String title;

  final void Function(BuildContext)? onPressed;

  final bool isPrimary;

  /// Only honored on iOS
  final bool isDestructive;

  const DialogAction({
    required this.title,
    required this.onPressed,
    this.isPrimary = false,
    this.isDestructive = false,
  });
}
