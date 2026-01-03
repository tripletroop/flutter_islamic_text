# Changelog

All notable changes to this package will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/).

---
## [1.0.1] - 2026-01-03
### Added
- Runtime font loading using `FontLoader` for the `IslamicPhrases` font.
  - The package now automatically loads the font at runtime.
  - No need to declare the font in the consuming app's `pubspec.yaml`.
- Ensures ligatures render correctly on Android, iOS, and simulators.

### Fixed
- Eliminated the need for the old `_assertFontRegistered` / `IslamicFontGuard` class.

### Changed
- Internal widget structure updated to use `FutureBuilder` for font loading.
- Improved cross-platform reliability for the `IslamicText` widget.

### Notes
- API of `IslamicText` remains backward-compatible.
- Use `version: 1.0.1+2` for this release.




## 1.0.0 – 2026-01-02

### Added
- Initial release of `islamic_text` package.
- `IslamicText` widget for rendering Islamic phrases with compact ligatures.
- `LigatureReplacer` for reversible phrase-to-symbol encoding/decoding.
- `IslamicTextStyleResolver` for applying custom font and vertical offsets.
- Support for custom font **IslamicPhrases**.
- Basic example app included in `/example` folder.
