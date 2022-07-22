import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;

/// An adaptive bottom navigation bar.
///
/// - `Android`: a [material.NavigationBar] is used
/// - `iOS`: a [CupertinoTabBar] is used
class BottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  final List<BottomNavigationBarItem> items;

  final ValueChanged<int> onItemSelected;

  const BottomNavigationBar({
    super.key,
    this.currentIndex = 0,
    required this.items,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (adaptive.isIOS) {
      return CupertinoTabBar(
        items: items,
        currentIndex: currentIndex,
        onTap: onItemSelected,
        backgroundColor: material.Theme.of(context).canvasColor,
      );
    }

    return material.NavigationBarTheme(
      data: material.NavigationBarThemeData(
        labelTextStyle: material.MaterialStateProperty.all(
          const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
      child: material.NavigationBar(
        destinations: items.map((item) {
          return material.NavigationDestination(
            icon: item.icon,
            label: item.label!,
          );
        }).toList(),
        selectedIndex: currentIndex,
        onDestinationSelected: onItemSelected,
      ),
    );
  }
}
