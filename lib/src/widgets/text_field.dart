import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:flutter_adaptive/platform.dart';
import 'package:flutter_adaptive/src/bloc/simple_value/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// An adaptive text field.
///
/// - `Android`: a [material.TextField] is used
/// - `iOS`: a [CupertinoTextField] is used
class TextField extends StatelessWidget {
  final Key? fieldKey;

  final bool enabled;
  final bool autofocus;
  final bool autocorrect;

  final TextEditingController? controller;

  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;

  final String label;
  final String? placeholder;
  final String? error;

  final Widget? prefix;
  final Widget? suffix;

  final int? maxLines;
  final int? maxLength;

  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const TextField({
    super.key,
    this.fieldKey,
    this.enabled = true,
    this.autofocus = false,
    this.autocorrect = true,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    required this.label,
    this.placeholder,
    this.error,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isIOS) {
      return BlocProvider<SimpleValueBloc<String?>>(
        create: (_) => SimpleValueBloc(controller?.text),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 2),
            Builder(
              builder: (context) {
                return CupertinoTextField(
                  key: fieldKey,
                  enabled: enabled,
                  autofocus: autofocus,
                  autocorrect: autocorrect,
                  controller: controller,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  textCapitalization: textCapitalization,
                  placeholder: placeholder,
                  prefix: prefix,
                  suffix: suffix,
                  maxLines: maxLines,
                  maxLength: maxLength,
                  onChanged: (value) {
                    context.read<SimpleValueBloc<String?>>().change(value);

                    onChanged?.call(value);
                  },
                  onSubmitted: onSubmitted,
                  style:
                      material.Theme.of(context).brightness == Brightness.dark
                          ? const TextStyle(color: material.Colors.white)
                          : null,
                );
              },
            ),
            if (error != null || maxLength != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextOneLine(
                        error ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: material.Theme.of(context).errorColor,
                        ),
                      ),
                    ),
                    if (maxLength != null)
                      BlocBuilder<SimpleValueBloc<String?>, String?>(
                        builder: (context, state) {
                          return Text(
                            '${state?.characters.length ?? 0} / $maxLength',
                            style: const TextStyle(fontSize: 12),
                          );
                        },
                      ),
                  ],
                ),
              ),
          ],
        ),
      );
    }

    return material.TextField(
      key: fieldKey,
      enabled: enabled,
      autofocus: autofocus,
      autocorrect: autocorrect,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: material.InputDecoration(
        labelText: label,
        hintText: placeholder,
        errorText: error,
        prefix: prefix,
        suffix: suffix,
      ),
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
