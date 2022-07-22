import 'package:flutter/material.dart';

extension BuildContextIsIOS on BuildContext {
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
}
