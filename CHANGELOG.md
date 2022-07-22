## 2.0.0

**BREAKING CHANGES:**

- Remove `isIOS` export in favor of a getter on `BuildContext` instances
  via an extension. This allows widgets to adapt to the current platform
  for web users too.

  > Replace
  >
  > ```dart
  > import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
  > 
  > adaptive.isIOS;
  > ```
  >
  > with
  >
  > ```dart
  > import 'package:flutter_adaptive/platform.dart';
  >
  > context.isIOS;
  > ```
- `scrollPhysics` and all icons now require a `BuildContext`

  > Replace
  >
  > ```dart
  > import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
  > 
  > adaptive.scrollPhysics;
  >
  > Icon(adaptive.Icons.add);
  > ```
  >
  > with
  >
  > ```dart
  > import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
  >
  > adaptive.scrollPhysics(context);
  >
  > Icon(adaptive.Icons.add(context));
  > ```

## 1.1.0

- Add `onGeneratePreviousPageTitle` global. Use this to generate
  a route's `previousPageTitle` from just one place if your use-case
  allows this.

## 1.0.2

- Update README

## 1.0.1

- Add example
- Add documentation

## 1.0.0

- Initial release
