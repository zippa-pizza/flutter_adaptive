import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class CustomFlexibleSpaceBar extends StatelessWidget {
  final String title;
  final double expandedHeight;

  const CustomFlexibleSpaceBar({
    super.key,
    required this.title,
    required this.expandedHeight,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double percent = (constraints.maxHeight - kToolbarHeight) *
            100 /
            (expandedHeight - kToolbarHeight);

        final Tween<double> fontSizeMultiplier =
            Tween<double>(begin: 1.5, end: 1);
        final double fontSize =
            Theme.of(context).textTheme.headline6!.fontSize! *
                fontSizeMultiplier.transform(1 - (percent / 100));

        final bool canPop = ModalRoute.of(context)?.canPop ?? false;

        return Padding(
          padding: EdgeInsetsTween(
            begin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
            end: EdgeInsets.only(left: canPop ? 72 : 16, bottom: 16, right: 16),
          ).transform(1 - (percent / 100)),
          child: Transform.translate(
            offset: Offset(0, constraints.maxHeight - fontSize - 16),
            child: TextOneLine(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: fontSize),
            ),
          ),
        );
      },
    );
  }
}
