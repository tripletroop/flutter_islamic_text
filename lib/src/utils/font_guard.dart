import 'package:islamic_text/src/utils/font_loader.dart';

class IslamicTextFontGuard {
  static void assertLoaded() {
    assert(IslamicTextFontLoader.isLoaded, '''
Islamic font not loaded.

You must call:

  await IslamicTextFontLoader.load();

before runApp(), e.g.:

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await IslamicTextFontLoader.load();
    runApp(MyApp());
  }
''');
  }
}
