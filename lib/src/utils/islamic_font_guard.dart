import 'package:flutter/widgets.dart';

/// Ensures the required Islamic font is registered at runtime.
abstract class IslamicFontGuard {
  static const String fontFamily = 'IslamicPhrases';

  /// Throws a descriptive [FlutterError] if the font is missing.
  /// Throws only if fallback is disabled.
  static bool ensureRegistered(bool allowFallback) {
    assert(() {
      final painter = TextPainter(
        text: const TextSpan(
          text: 'test',
          style: TextStyle(fontFamily: fontFamily),
        ),
        textDirection: TextDirection.ltr,
      );
      try {
        painter.layout();
        return true;
      } catch (_) {
        if (!allowFallback) {
          throw FlutterError.fromParts([
            ErrorSummary('IslamicPhrases font is not registered.'),
            ErrorDescription(
              'IslamicText requires a custom font to render ligatures correctly.',
            ),
            ErrorHint(
              'Add the following to your pubspec.yaml:\n\n'
              'flutter:\n'
              '  fonts:\n'
              '    - family: IslamicPhrases\n'
              '      fonts:\n'
              '        - asset: packages/islamic_text/fonts/islamic_phrases.ttf\n',
            ),
          ]);
        }
        return false;
      }
    }());
    return true;
  }
}
