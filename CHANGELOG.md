## 0.0.3

* **BREAKING CHANGES**:
  * Refactored model imports: `lib/api/global_response.dart` removed. Models are now grouped under `lib/models/` and exported via the main entry point. Import `package:inshorts_flutter/inshorts_flutter.dart` instead.
  * Standardized `NewsType` enums to `camelCase` (e.g., `all_news` -> `allNews`, `top_stories` -> `topStories`) to align with Dart naming conventions.
* Refactored model classes into separate files for better maintainability.
* Added comprehensive unit tests and structural schema validation.
* Enhanced `InShorts.getNews` with robust null-safety and error handling.
* Improved example app with a beautiful, compact news card design.
* Updated `InShorts` utility methods to use modern Dart enhanced switch expressions.

## 0.0.2

* Update `pubspec.yaml` description.

## 0.0.1

* initial release.
