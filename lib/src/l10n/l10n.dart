import 'package:flutter/material.dart';
import 'package:flutter_adaptive/src/l10n/base.dart' as base;

import 'en.dart' as en;
import 'it.dart' as it;

class PackageLocalizations {
  static currentLocale(BuildContext context) => Localizations.localeOf(context);

  static base.PackageLocalizations of(BuildContext context) {
    final Locale locale = currentLocale(context);

    if (locale.languageCode == 'it') {
      return it.PackageLocalizations();
    }

    return en.PackageLocalizations();
  }
}
