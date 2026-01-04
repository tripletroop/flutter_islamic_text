import 'package:flutter/services.dart';

class IslamicTextFontLoader {
  IslamicTextFontLoader._();

  static final IslamicTextFontLoader instance = IslamicTextFontLoader._();

  static const String family = 'IslamicPhrases';
  static bool _loaded = false;

  static bool get isLoaded => _loaded;

  /// Must be called once at app startup
  static Future<void> load() async {
    if (_loaded) return;

    final ByteData data = await rootBundle.load(
      'packages/islamic_text/lib/fonts/islamic_phrases.ttf',
    );

    final loader = FontLoader(family);
    loader.addFont(Future.value(data));

    await loader.load();
    _loaded = true;
  }
}
