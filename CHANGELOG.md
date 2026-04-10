## [2.0.1] April 10, 2026

* Patch release with minor fixes.

## [2.0.0] April 10, 2026

* **BREAKING**: `front` and `back` parameters changed from `Container` to `Widget` for greater flexibility.
* Migrated to Dart 3 with full null safety.
* Updated SDK constraint to `>=3.0.0 <4.0.0`.
* Replaced deprecated `Key? key` constructors with `super.key`.
* Replaced `@required` with `required`.
* Removed `AnimatedBackground` widget; uses `DecoratedBox` when `bg` is provided.
* Added explicit type parameter to `TweenAnimationBuilder<double>`.
* Fixed `curve` parameter being ignored in `FlippableBox`.
* Removed deprecated `author` field from pubspec.

## [1.0.3] Feb 12, 2020

* Initial release.
