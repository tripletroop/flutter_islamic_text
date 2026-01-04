import 'package:flutter/widgets.dart';
import 'package:islamic_text/src/ligature/ligature_replacer.dart';

/// Converts encoded text into styled [InlineSpan]s.
class IslamicTextSpanBuilder {
  IslamicTextSpanBuilder({
    required this.text,
    required this.normalStyle,
    required this.islamicStyle,
    required this.verticalOffset,
  });

  final String text;
  final TextStyle normalStyle;
  final TextStyle islamicStyle;
  final double verticalOffset;
  final replacer = LigatureReplacer();

  List<InlineSpan> build() {
    var encodedText = replacer.encode(text);
    final pattern = RegExp(
      '(${replacer.symbols.map(RegExp.escape).join('|')})',
    );
    final spans = <InlineSpan>[];
    var currentIndex = 0;

    for (final match in pattern.allMatches(encodedText)) {
      // Add text before match
      if (match.start > currentIndex) {
        spans.add(_buildSpan(encodedText.substring(currentIndex, match.start)));
      }

      // Add Islamic ligature
      spans.add(_buildSpan(match.group(0)!));
      currentIndex = match.end;
    }

    // Add remaining text
    if (currentIndex < encodedText.length) {
      spans.add(_buildSpan(encodedText.substring(currentIndex)));
    }

    return spans;
  }

  InlineSpan _buildSpan(String segment) {
    if (replacer.symbols.contains(segment)) {
      return WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: Transform.translate(
          offset: Offset(0, verticalOffset),
          child: Text(segment, style: islamicStyle),
        ),
      );
    }

    return TextSpan(text: segment, style: normalStyle);
  }
}
