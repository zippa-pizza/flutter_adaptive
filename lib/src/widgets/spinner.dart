import 'package:flutter/material.dart';

/// An adaptive spinner.
///
/// - `Android`: a [CircularProgressIndicator.adaptive] is used
/// - `iOS`: a [CircularProgressIndicator.adaptive] is used
class Spinner extends StatelessWidget {
  final double? size;
  final double thickness;
  final double? padding;

  final bool centered;

  final Color? color;

  final double? value;

  const Spinner({
    super.key,
    this.size,
    this.thickness = 4,
    this.color,
    this.padding = 10,
    this.centered = true,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    Widget spinner = CircularProgressIndicator.adaptive(
      strokeWidth: thickness,
      value: value,
      valueColor: AlwaysStoppedAnimation<Color>(
        color ?? Theme.of(context).colorScheme.primary,
      ),
    );

    if (size != null) {
      spinner = SizedBox.square(
        dimension: size,
        child: spinner,
      );
    }

    if (padding != null) {
      spinner = Padding(
        padding: EdgeInsets.all(padding!),
        child: spinner,
      );
    }

    if (centered) {
      spinner = Center(child: spinner);
    }

    return spinner;
  }
}
