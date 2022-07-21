import 'package:flutter/material.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;

class TapArea extends StatelessWidget {
  final Widget child;

  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const TapArea({
    super.key,
    required this.child,
    required this.onTap,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return adaptive.Button(
      onPressed: onTap,
      onLongPress: onLongPress,
      padding: padding ?? EdgeInsets.zero,
      foregroundColor: DefaultTextStyle.of(context).style.color,
      backgroundColor: backgroundColor ?? Colors.transparent,
      borderRadius: borderRadius ?? BorderRadius.zero,
      textStyle: DefaultTextStyle.of(context).style,
      child: child,
    );
  }
}
