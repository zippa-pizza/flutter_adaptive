import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_adaptive/src/l10n/l10n.dart';

/// An adaptive menu button.
///
/// - `Android`: a [PopupMenuButton] is used
/// - `iOS`: a [adaptive.IconButton] is used
class MenuButton extends StatelessWidget {
  final List<adaptive.ActionSheetItem> items;

  const MenuButton({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (adaptive.isIOS) {
      return adaptive.IconButton(
        icon: const Icon(CupertinoIcons.ellipsis),
        tooltip: PackageLocalizations.of(context).showMenu,
        onPressed: () =>
            adaptive.showActionSheet(context: context, items: items),
      );
    }

    return PopupMenuButton<int>(
      itemBuilder: (context) {
        return items
            .map(
              (item) => PopupMenuItem(
                value: items.indexOf(item),
                enabled: item.onPressed != null,
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: item.isDestructive ? Colors.red : null,
                  ),
                ),
              ),
            )
            .toList();
      },
      onSelected: (index) => items[index].onPressed?.call(),
    );
  }
}
