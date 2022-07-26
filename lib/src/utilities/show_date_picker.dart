import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_adaptive/platform.dart';
import 'package:flutter_adaptive/src/bloc/simple_value/bloc.dart';
import 'package:flutter_adaptive/src/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Shows a date picker.
Future<DateTime?> showDatePicker({
  required BuildContext context,
  required DateTime firstDate,
  required DateTime initialDate,
  required DateTime lastDate,
}) {
  return showModalBottomSheet<DateTime>(
    context: context,
    useRootNavigator: true,
    builder: (context) {
      return BlocProvider<SimpleValueBloc<DateTime>>(
        create: (_) => SimpleValueBloc<DateTime>(initialDate),
        child: BlocBuilder<SimpleValueBloc<DateTime>, DateTime>(
          builder: (context, selectedDate) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  () {
                    if (context.isIOS) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        child: CupertinoTheme(
                          data: CupertinoThemeData(
                            brightness: Theme.of(context).brightness,
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            minimumDate: firstDate,
                            initialDateTime: initialDate,
                            maximumDate: lastDate,
                            onDateTimeChanged: context
                                .read<SimpleValueBloc<DateTime>>()
                                .change,
                          ),
                        ),
                      );
                    }

                    return CalendarDatePicker(
                      firstDate: firstDate,
                      initialDate: initialDate,
                      lastDate: lastDate,
                      onDateChanged:
                          context.read<SimpleValueBloc<DateTime>>().change,
                    );
                  }(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: adaptive.Button(
                      text: PackageLocalizations.of(context).ok,
                      onPressed: () => Navigator.pop(context, selectedDate),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
