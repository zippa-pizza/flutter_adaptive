import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;

class DropdownButton<T> extends StatelessWidget {
  final T? value;

  final List<adaptive.DropdownMenuItem<T>> items;

  final String? hint;

  final void Function(T? value) onChanged;

  const DropdownButton({
    super.key,
    required this.value,
    required this.items,
    this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (adaptive.isIOS) {
      final adaptive.DropdownMenuItem<T>? initialItem =
          items.firstWhereOrNull((item) => item.value == value);

      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: material.Theme.of(context).dividerColor),
          ),
        ),
        child: adaptive.Button(
          icon: Icon(
            adaptive.Icons.arrowDropDown,
            color: IconTheme.of(context).color,
          ),
          text: initialItem?.label ?? hint,
          padding: const EdgeInsets.only(
            top: 4,
            right: 6,
            bottom: 4,
          ),
          foregroundColor: initialItem != null
              ? material.Theme.of(context).textTheme.bodyText2!.color
              : material.Theme.of(context).textTheme.caption!.color,
          backgroundColor: material.Colors.transparent,
          onPressed: () async {
            int selectedIndex =
                initialItem != null ? items.indexOf(initialItem) : 0;

            await _showDialog(
              context,
              CupertinoPicker(
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: 32,
                scrollController:
                    FixedExtentScrollController(initialItem: selectedIndex),
                onSelectedItemChanged: (index) => selectedIndex = index,
                children: items.map((item) {
                  return Center(
                    child: Text(
                      item.label,
                      style: TextStyle(
                        color: material.Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .color,
                      ),
                    ),
                  );
                }).toList(),
              ),
            );

            onChanged(items[selectedIndex].value);
          },
        ),
      );
    }

    return material.DropdownButton<T>(
      value: value,
      items: items.map((item) {
        return material.DropdownMenuItem(
          value: item.value,
          child: Text(item.label),
        );
      }).toList(),
      hint: hint != null ? Text(hint!) : null,
      onChanged: onChanged,
    );
  }

  Future<void> _showDialog(BuildContext context, Widget child) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
