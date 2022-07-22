import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;

/// An adaptive icon button.
///
/// - `Android`: a [material.IconButton] is used
/// - `iOS`: a custom widget is used
class IconButton extends StatelessWidget {
  final Widget icon;
  final double iconSize;

  final Color? color;

  final String? tooltip;

  final void Function()? onPressed;

  const IconButton({
    super.key,
    this.iconSize = 24,
    this.color,
    this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (adaptive.isIOS) {
      return SizedBox.square(
        dimension: iconSize * 2,
        child: IconTheme(
          data: IconTheme.of(context).copyWith(size: iconSize),
          child: adaptive.Button(
            icon: icon,
            tooltip: tooltip,
            onPressed: onPressed,
            padding: const EdgeInsets.all(12),
            foregroundColor: color ?? IconTheme.of(context).color,
            backgroundColor: material.Colors.transparent,
            disabledBackgroundColor: material.Colors.transparent,
          ),
        ),
      );
    }

    return material.IconButton(
      icon: icon,
      iconSize: iconSize,
      color: color,
      tooltip: tooltip,
      onPressed: onPressed,
    );
  }
}
