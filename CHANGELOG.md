## 4.0.2

- Fixed `use_build_context_synchronously` lint warning

## 4.0.1

- Format files

## 4.0.0

> This version requires Flutter 3.7.0 or greater

**BREAKING CHANGES:**

- Add support for Flutter 3.7.0

## 3.0.2

- Fixed an error in `ListTile` when `title` was `null`

## 3.0.1

- Fix wrong doc comment

## 3.0.0

> This version requires Flutter 3.3.0 or greater

**BREAKING CHANGES:**

- Replaced custom flexible space bar with `SliverAppBar.large`
- Add support for Flutter 3.3.0

## 2.3.0

- On iOS `ListTile`s no longer have a `maxLines` limit set to 1

## 2.2.1

- Updated changelog

## 2.2.0

**BREAKING CHANGES:**

- Moved `Icons` class in a separate package (`adaptive_icons`)

## 2.1.0

- Add vertical spacing to dialog buttons for when they are placed vertically

## 2.0.1

- Fix issues with `showDatePicker()` and `showActionSheet()`

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
  > // The extension with the isIOS getter is exported from here
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
