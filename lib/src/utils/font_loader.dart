import 'package:flutter/services.dart';

class IslamicFontLoader {
  static bool _loaded = false;

  /// Loads the IslamicPhrases font once at runtime
  static Future<void> load() async {
    if (_loaded) return;
    final loader = FontLoader('IslamicPhrases');
    loader.addFont(
      rootBundle.load('packages/islamic_text/lib/fonts/islamic_phrases.ttf'),
    );
    await loader.load();
    _loaded = true;
  }
}
