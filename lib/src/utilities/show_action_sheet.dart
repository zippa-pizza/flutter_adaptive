import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_adaptive/src/l10n/l10n.dart';

Future<void> showActionSheet({
  required BuildContext context,
  required List<ActionSheetItem> items,
}) {
  if (adaptive.isIOS) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: Theme.of(context).brightness,
        ),
        child: CupertinoActionSheet(
          actions: items
              .map(
                (item) => CupertinoActionSheetAction(
                  onPressed: () {
                    if (item.onPressed == null) {
                      return;
                    }

                    Navigator.pop(context);

                    item.onPressed!();
                  },
                  isDestructiveAction: item.isDestructive,
                  child: Text(item.title),
                ),
              )
              .toList(),
          cancelButton: CupertinoActionSheetAction(
            onPressed: Navigator.of(context).pop,
            child: Text(PackageLocalizations.of(context).cancel),
          ),
        ),
      ),
    );
  }

  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        children: [
          ...items.map(
            (item) => adaptive.ListTile(
              leading: item.icon != null ? Icon(item.icon) : null,
              title: Text(
                item.title,
                style: TextStyle(
                  color: item.isDestructive ? Colors.red : null,
                ),
              ),
              onTap: item.onPressed != null
                  ? () {
                      Navigator.pop(context);

                      item.onPressed!();
                    }
                  : null,
            ),
          ),
          const Divider(),
          adaptive.ListTile(
            leading: const Icon(Icons.cancel),
            title: Text(PackageLocalizations.of(context).cancel),
            onTap: Navigator.of(context).pop,
          ),
        ],
      );
    },
  );
}

class ActionSheetItem {
  final String title;

  /// Only honored on Android
  final IconData? icon;

  final bool isDestructive;

  final VoidCallback? onPressed;

  const ActionSheetItem({
    required this.title,
    required this.onPressed,
    this.icon,
    this.isDestructive = false,
  });
}
