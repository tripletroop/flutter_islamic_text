import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_text/islamic_text.dart';

void main() {
  group('LigatureReplacer', () {
    test('encodes known phrases into symbols', () {
      final replacer = LigatureReplacer();
      final encoded = replacer.encode('الله عز وجل');
      expect(encoded.contains('丂'), isTrue);
    });

    test('decodes symbols back to phrases', () {
      final replacer = LigatureReplacer();
      final decoded = replacer.decode('هذا 三');
      expect(decoded.contains('صلى الله عليه وسلم'), isTrue);
    });
  });
}
