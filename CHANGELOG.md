# Changelog

All notable changes to this package will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/).

---
## 1.1.1

### Changed
- Broadened Dart SDK compatibility to `>=2.17.0 <4.0.0` to support more Flutter projects.
- Updated development lint configuration.
- No functional or API changes.


## 1.1.0

### Fixed
- Fixed incorrect rendering order when multiple Islamic ligatures appear on the same line in RTL text.
- Resolved bidirectional layout issues by removing `WidgetSpan` usage and relying on `TextSpan` only.

### Changed
- Migrated ligature encoding from CJK characters to Unicode Private Use Area (PUA) for correct RTL behavior.
- Updated the bundled font file to reflect new PUA mappings and corrected vertical metrics.
- Removed vertical alignment adjustments; ligature alignment is now handled directly in the font.

### Added
- Exposed `IslamicTextSpanBuilder` as a public API to allow consumers to generate `TextSpan` output directly without using widgets.

### Internal
- Refactored span-building logic into `IslamicTextSpanBuilder` for better separation of concerns and reuse.


## 1.0.3

### Added
- Added all the optional Text.rich attributes to the widget for improved customization.


## 1.0.2

### Changed
- The `FontLoader` now runs at the main() function before runApp to avoid using FutureBuilder everytime the font is needed

### Added
- Added `FontGuard` class to assert if the `FontLoader` not loaded


## 1.0.1

### Added
- Runtime font loading using `FontLoader` for the `IslamicPhrases` font.
  - The package now automatically loads the font at runtime.
  - No need to declare the font in the consuming app's `pubspec.yaml`.
- Ensures ligatures render correctly on Android, iOS, and simulators.

### Changed
- Internal widget structure updated to use `FutureBuilder` for font loading.
- Improved cross-platform reliability for the `IslamicText` widget.


## 1.0.0

### Added
- Initial release of `islamic_text` package.
- `IslamicText` widget for rendering Islamic phrases with compact ligatures.
- `LigatureReplacer` for reversible phrase-to-symbol encoding/decoding.
- `IslamicTextStyleResolver` for applying custom fonts.
- Support for custom font **IslamicPhrases**.
- Basic example app included in `/example` folder.
