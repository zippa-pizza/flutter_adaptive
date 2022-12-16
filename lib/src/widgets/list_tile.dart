import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_adaptive/platform.dart';
import 'package:flutter_adaptive/src/config/config.dart';
import 'package:flutter_adaptive/src/widgets/cupertino_list_tile.dart';

/// An adaptive list tile.
///
/// - `Android`: a [ListTile] is used
/// - `iOS`: a custom [CupertinoListTile] is used
class ListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  final bool enabled;

  final bool isThreeLine;

  /// Only honored on Android
  final Color? tileColor;

  /// Only honored on Android
  final Color? textColor;

  /// Only honored on Android
  final Color? iconColor;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.enabled = true,
    this.isThreeLine = false,
    this.tileColor,
    this.textColor,
    this.iconColor,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isIOS) {
      final EdgeInsets listTileContentPadding = material.Theme.of(context)
          .listTileTheme
          .contentPadding!
          .resolve(Directionality.of(context));

      return CupertinoTheme(
        data: CupertinoThemeData(
          brightness: material.Theme.of(context).brightness,
          primaryColor: CupertinoColors.systemGrey.resolveFrom(context),
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(
              fontFamily: fontFamily(context),
              fontSize: 17,
              color: const CupertinoDynamicColor.withBrightness(
                color: CupertinoColors.black,
                darkColor: CupertinoColors.white,
              ),
            ),
          ),
        ),
        child: GestureDetector(
          onLongPress: enabled ? onLongPress : null,
          child: CupertinoListTile.notched(
            leading: leading,
            title: Builder(
              builder: (context) {
                return DefaultTextStyle(
                  style: DefaultTextStyle.of(context).style,
                  maxLines: double.maxFinite.toInt(),
                  child: title ?? const SizedBox(),
                );
              },
            ),
            subtitle: subtitle != null
                ? Builder(
                    builder: (context) {
                      return DefaultTextStyle(
                        style: DefaultTextStyle.of(context).style,
                        maxLines: double.maxFinite.toInt(),
                        child: subtitle!,
                      );
                    },
                  )
                : null,
            trailing: trailing is Icon &&
                    (trailing! as Icon).icon == CupertinoIcons.chevron_right
                ? const CupertinoListTileChevron()
                : trailing,
            onTap: enabled ? onTap : null,
            padding: EdgeInsets.only(
              left: listTileContentPadding.left,
              top: max(
                listTileContentPadding.top,
                material.Theme.of(context).listTileTheme.minVerticalPadding!,
              ),
              right: listTileContentPadding.right,
              bottom: max(
                listTileContentPadding.bottom,
                material.Theme.of(context).listTileTheme.minVerticalPadding!,
              ),
            ),
          ),
        ),
      );
    }

    return material.ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      enabled: enabled,
      isThreeLine: isThreeLine,
      tileColor: tileColor,
      textColor: textColor,
      iconColor: iconColor,
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
