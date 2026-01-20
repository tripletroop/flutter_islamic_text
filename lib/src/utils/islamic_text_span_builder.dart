import 'package:flutter/widgets.dart';
import 'package:islamic_text/src/ligature/ligature_replacer.dart';
import 'package:islamic_text/src/style/islamic_text_style_resolver.dart';
import 'package:islamic_text/src/utils/font_guard.dart';

class IslamicTextSpanBuilder {
  IslamicTextSpanBuilder({
    required this.text,
    this.unresolvedNormalStyle,
    this.unresolvedIslamicStyle,
  }) {
    IslamicTextFontGuard.assertLoaded();
  }

  final String text;
  final TextStyle? unresolvedNormalStyle;
  final TextStyle? unresolvedIslamicStyle;
  final replacer = LigatureReplacer();

  TextSpan build(BuildContext context) {
    final styleResolver = IslamicTextStyleResolver(
      context: context,
      normalStyle: unresolvedNormalStyle,
      islamicStyle: unresolvedIslamicStyle,
    );
    var encodedText = replacer.encode(text);
    final pattern = RegExp(
      '(${replacer.symbols.map(RegExp.escape).join('|')})',
    );
    final spans = <TextSpan>[];
    var currentIndex = 0;

    for (final match in pattern.allMatches(encodedText)) {
      // Add text before match
      if (match.start > currentIndex) {
        spans.add(
          _buildSpan(
            encodedText.substring(currentIndex, match.start),
            styleResolver,
          ),
        );
      }

      // Add Islamic ligature
      spans.add(_buildSpan(match.group(0)!, styleResolver));
      currentIndex = match.end;
    }

    // Add remaining text
    if (currentIndex < encodedText.length) {
      spans.add(_buildSpan(encodedText.substring(currentIndex), styleResolver));
    }
    return TextSpan(children: spans);
  }

  TextSpan _buildSpan(String segment, IslamicTextStyleResolver resolvedStyle) {
    return TextSpan(
      text: segment,
      style: replacer.symbols.contains(segment)
          ? resolvedStyle.islamicStyle.copyWith(
              height: 1,
              leadingDistribution: TextLeadingDistribution.even,
            )
          : resolvedStyle.normalStyle,
    );
  }
}
