import 'dart:math';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:resolve_font_height/resolve_font_height.dart';

/// An adaptive toggle buttons widget.
///
/// - `Android`: a [material.ToggleButtons] widget is used
/// - `iOS`: a [CupertinoSlidingSegmentedControl] is used
class ToggleButtons extends StatelessWidget {
  final int currentIndex;

  final List<String> items;

  final ValueChanged<int> onItemSelected;

  /// Has no effect on iOS
  final bool sameSize;

  const ToggleButtons({
    super.key,
    this.currentIndex = 0,
    required this.items,
    required this.onItemSelected,
    this.sameSize = false,
  }) : assert(items.length > 1);

  static Size preferredSize(BuildContext context) {
    double itemHeight = resolveFontHeight(context) + // Item text
        10 + // Top padding
        10; // Bottom padding

    if (adaptive.isIOS) {
      const double minControlSize = 28;

      itemHeight =
          max(resolveFontHeight(context), minControlSize) + // Item text
              2 + // Item top padding
              2 + // Item bottom padding
              4 + // Top padding
              4; // Bottom padding
    }

    return Size.fromHeight(itemHeight);
  }

  @override
  Widget build(BuildContext context) {
    if (adaptive.isIOS) {
      return Padding(
        padding: const EdgeInsets.all(4),
        child: CupertinoSlidingSegmentedControl<int>(
          children: {
            for (final String item in items)
              items.indexOf(item): TextOneLine(item),
          },
          groupValue: currentIndex,
          onValueChanged: (value) => onItemSelected(value ?? currentIndex),
        ),
      );
    }

    final Widget widget = LayoutBuilder(
      builder: (context, constraints) {
        return material.ToggleButtons(
          tapTargetSize: material.MaterialTapTargetSize.shrinkWrap,
          isSelected:
              List.generate(items.length, (index) => index == currentIndex),
          onPressed: onItemSelected,
          constraints: const BoxConstraints(),
          renderBorder: false,
          children: items.map((item) {
            double? width;

            if (sameSize) {
              width = constraints.maxWidth / items.length;
            }

            return SizedBox(
              width: width,
              height: preferredSize(context).height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    right: items.last != item
                        ? BorderSide(
                            width: 0.5,
                            color: material.ToggleButtonsTheme.of(context)
                                    .borderColor ??
                                material.Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.12),
                          )
                        : BorderSide.none,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Center(
                    child: TextOneLine(
                      item,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );

    if (!sameSize) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: widget,
      );
    }

    return widget;
  }
}
