import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_adaptive/src/bloc/simple_value/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpansionTile extends StatelessWidget {
  final Key? tileKey;

  final String title;

  final String? subtitle;
  final Widget? subtitleWidget;

  final Widget? leading;

  final List<Widget> children;

  final bool initiallyExpanded;

  const ExpansionTile({
    super.key,
    this.tileKey,
    required this.title,
    this.subtitle,
    this.subtitleWidget,
    this.leading,
    required this.children,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget titleWidget = Text(
      title,
      style: TextStyle(
        color: material.Theme.of(context).textTheme.subtitle1!.color,
      ),
    );

    Widget? subtitleWidget = this.subtitleWidget;

    if (subtitleWidget == null && subtitle != null) {
      subtitleWidget = Text(subtitle!);
    }

    if (subtitleWidget != null) {
      subtitleWidget = DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(
              color: material.Theme.of(context).textTheme.caption!.color,
            ),
        child: subtitleWidget,
      );
    }

    if (adaptive.isIOS) {
      return _IosExpansionTile(
        tileKey: tileKey,
        initiallyExpanded: initiallyExpanded,
        leading: leading,
        title: titleWidget,
        subtitle: subtitleWidget,
        children: children,
      );
    }

    return material.ExpansionTile(
      key: tileKey,
      initiallyExpanded: initiallyExpanded,
      leading: leading,
      title: titleWidget,
      subtitle: subtitleWidget,
      children: children,
    );
  }
}

class _IosExpansionTile extends StatefulWidget {
  final Key? tileKey;

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;

  final List<Widget> children;

  final bool initiallyExpanded;

  const _IosExpansionTile({
    this.tileKey,
    this.leading,
    required this.title,
    this.subtitle,
    required this.children,
    required this.initiallyExpanded,
  });

  @override
  State<_IosExpansionTile> createState() => _IosExpansionTileState();
}

class _IosExpansionTileState extends State<_IosExpansionTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _arrow;
  late final Animation<double> _children;

  @override
  void initState() {
    super.initState();

    const Duration duration = Duration(milliseconds: 200);

    _controller = AnimationController(
      vsync: this,
      value: widget.initiallyExpanded ? 1 : 0,
      duration: duration,
    );

    _arrow = _controller.drive(Tween(begin: 0.0, end: 0.5));
    _children = _controller.view;
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SimpleValueBloc<bool>(widget.initiallyExpanded),
      child: BlocBuilder<SimpleValueBloc<bool>, bool>(
        builder: (context, isExpanded) {
          return Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: isExpanded
                      ? material.Theme.of(context).dividerColor
                      : material.Colors.transparent,
                ),
              ),
            ),
            child: Column(
              children: [
                adaptive.ListTile(
                  key: widget.tileKey,
                  leading: widget.leading,
                  title: widget.title,
                  subtitle: widget.subtitle,
                  trailing: RotationTransition(
                    turns: _arrow,
                    child: Icon(adaptive.Icons.expandMore),
                  ),
                  onTap: () {
                    isExpanded ? _controller.reverse() : _controller.forward();

                    context.read<SimpleValueBloc<bool>>().change(!isExpanded);
                  },
                ),
                AnimatedBuilder(
                  animation: _children,
                  builder: (context, child) {
                    return ClipRect(
                      child: Align(
                        heightFactor: _controller.value,
                        child: child,
                      ),
                    );
                  },
                  child: Column(children: widget.children),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
