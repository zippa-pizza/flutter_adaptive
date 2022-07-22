import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_adaptive/platform.dart';
import 'package:flutter_adaptive/src/l10n/l10n.dart';

/// An adaptive search text field.
///
/// - `Android`: a [TextField] is used
/// - `iOS`: a [CupertinoSearchTextField] is used
class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  final EdgeInsetsGeometry padding;

  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const SearchTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    required this.controller,
    this.padding = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    if (context.isIOS) {
      return Padding(
        padding: padding,
        child: CupertinoSearchTextField(
          controller: controller,
          placeholder: hintText,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          style: TextStyle(color: Theme.of(context).textTheme.subtitle1!.color),
        ),
      );
    }

    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          labelText: PackageLocalizations.of(context).search,
          hintText: hintText,
          suffixIcon: adaptive.IconButton(
            icon: const Icon(Icons.search),
            tooltip: PackageLocalizations.of(context).search,
            onPressed: () => onSubmitted?.call(controller.text),
          ),
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
