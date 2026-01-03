import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_text/islamic_text.dart';

void main() {
  Future<void> loadTestFonts() async {
    final fontData = File('fonts/islamic_phrases.ttf').readAsBytesSync();

    final loader = FontLoader('IslamicPhrases')
      ..addFont(Future.value(ByteData.view(fontData.buffer)));

    await loader.load();
  }

  testWidgets('Islamic ligature renders correctly', (tester) async {
    await loadTestFonts();

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                IslamicText(
                  text: 'صلى الله عليه وسلم',
                  normalTextStyle: TextStyle(fontSize: 60),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await expectLater(
      find.byType(IslamicText),
      matchesGoldenFile('goldens/islamic_text_ligature.png'),
    );
  });
}
