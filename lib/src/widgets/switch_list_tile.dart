import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_adaptive/platform.dart';
import 'package:flutter_adaptive/src/bloc/simple_value/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// An adaptive switch list tile.
///
/// - `Android`: a [adaptive.ListTile] is used
/// - `iOS`: a [adaptive.ListTile] is used
class SwitchListTile extends StatelessWidget {
  final bool value;

  final String title;
  final String? subtitle;

  final Widget? secondary;

  final FutureOr<void> Function(bool)? onChanged;

  const SwitchListTile({
    super.key,
    required this.value,
    required this.title,
    this.subtitle,
    this.secondary,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SimpleValueBloc<bool>>(
      create: (_) => SimpleValueBloc(false),
      child: Builder(
        builder: (context) {
          return adaptive.ListTile(
            enabled: onChanged != null,
            leading: secondary,
            title: Text(title),
            subtitle: subtitle != null ? Text(subtitle!) : null,
            trailing: BlocBuilder<SimpleValueBloc<bool>, bool>(
              builder: (context, isLoading) {
                final bool isEnabled = !isLoading && onChanged != null;

                return Switch.adaptive(
                  value: value,
                  onChanged:
                      isEnabled ? (value) => _onChanged(context, value) : null,
                );
              },
            ),
            onTap: !context.isIOS ? () => _onChanged(context, !value) : null,
          );
        },
      ),
    );
  }

  Future<void> _onChanged(BuildContext context, bool value) async {
    context.read<SimpleValueBloc<bool>>().change(true);

    await onChanged?.call(value);

    if (context.mounted) {
      context.read<SimpleValueBloc<bool>>().change(false);
    }
  }
}
