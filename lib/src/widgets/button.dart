import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_adaptive/src/config/config.dart';

class Button extends StatelessWidget {
  final Widget? icon;
  final String? text;
  final Widget? child;

  final String? tooltip;
  final TextStyle? textStyle;
  final Color? foregroundColor;
  final Color? backgroundColor;

  /// Only honored on iOS
  final Color? disabledBackgroundColor;

  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  /// One of [icon] or [text] must be non-null
  const Button({
    super.key,
    this.icon,
    this.text,
    this.child,
    this.tooltip,
    this.textStyle,
    this.foregroundColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.padding,
    this.borderRadius,
    required this.onPressed,
    this.onLongPress,
  }) : assert(icon != null || text != null || child != null);

  @override
  Widget build(BuildContext context) {
    final Widget button = buildButton(context);

    if (tooltip != null) {
      return Tooltip(
        message: tooltip,
        child: button,
      );
    }

    return button;
  }

  Widget buildButton(BuildContext context) {
    if (adaptive.isIOS) {
      final Color finalForegroundColor = foregroundColor ??
          Theme.of(context)
              .textButtonTheme
              .style!
              .foregroundColor!
              .resolve({MaterialState.selected})!;

      final Color finalBackgroundColor = backgroundColor ??
          Theme.of(context)
              .textButtonTheme
              .style!
              .backgroundColor!
              .resolve({MaterialState.selected})!;

      final Color finalDisabledBackgroundColor =
          disabledBackgroundColor ?? finalBackgroundColor.withOpacity(0.3);

      Widget buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: EdgeInsets.only(
                right: text != null && text!.isNotEmpty ? 8 : 0,
              ),
              child: IconTheme(
                data:
                    IconTheme.of(context).copyWith(color: finalForegroundColor),
                child: icon!,
              ),
            ),
          if (text != null && text!.isNotEmpty)
            Text(
              text!,
              style: TextStyle(
                fontFamily: fontFamily(context),
                color: finalForegroundColor,
              ).merge(textStyle),
            ),
        ],
      );

      if (child != null) {
        buttonChild = DefaultTextStyle(
          style: textStyle ?? DefaultTextStyle.of(context).style,
          child: child!,
        );
      }

      return GestureDetector(
        onLongPress: onLongPress,
        child: CupertinoButton(
          color: finalBackgroundColor,
          disabledColor: finalDisabledBackgroundColor,
          minSize: 0,
          padding: padding ??
              const EdgeInsets.symmetric(
                vertical: 14, // Default
                horizontal: 18,
              ),
          onPressed: onPressed,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(8)),
          child: buttonChild,
        ),
      );
    }

    ButtonStyle style = Theme.of(context).textButtonTheme.style!;

    if (foregroundColor != null) {
      style = style.copyWith(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return foregroundColor!.withOpacity(0.5);
          }

          return foregroundColor;
        }),
      );
    }

    if (backgroundColor != null) {
      style = style.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return backgroundColor!.withOpacity(0.5);
          }

          return backgroundColor;
        }),
      );
    }

    if (padding != null) {
      style = style.copyWith(padding: MaterialStateProperty.all(padding));
    }

    if (borderRadius != null) {
      style = style.copyWith(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: borderRadius!),
        ),
      );
    }

    if (textStyle != null) {
      style = style.copyWith(
        textStyle: MaterialStateProperty.all(
          style.textStyle!.resolve({MaterialState.selected})!.merge(textStyle),
        ),
      );
    }

    if (child != null) {
      return TextButton(
        style: style,
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: child!,
      );
    }

    if (icon == null) {
      return TextButton(
        style: style,
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: Text(text!, style: textStyle),
      );
    }

    return text == null || text!.isEmpty
        ? TextButton(
            style: style,
            onPressed: onPressed,
            onLongPress: onLongPress,
            child: icon!,
          )
        : TextButton.icon(
            icon: icon!,
            label: Text(text!, style: textStyle),
            style: style,
            onPressed: onPressed,
            onLongPress: onLongPress,
          );
  }
}
