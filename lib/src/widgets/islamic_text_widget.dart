import 'package:flutter/material.dart';
import 'package:islamic_text/src/utils/font_loader.dart';
import 'package:islamic_text/src/utils/islamic_text_span_builder.dart';
import 'package:islamic_text/src/style/islamic_text_style_resolver.dart';
import 'package:islamic_text/src/ligature/ligature_replacer.dart';

/// A Flutter text widget that replaces Islamic phrases
/// (e.g. "صلى الله عليه وسلم") with compact ligatures (e.g. ﷺ)
/// and renders them using a dedicated Islamic font.
///
///
/// ⚠️ Required setup:
/// The `IslamicPhrases` font must be declared in the host app:
///
/// ```yaml
/// flutter:
///   fonts:
///     - family: IslamicPhrases
///       fonts:
///         - asset: packages/islamic_text/fonts/islamic_phrases.ttf
/// ```
@immutable
class IslamicText extends StatelessWidget {
  /// Creates an [IslamicText] widget.
  const IslamicText({
    super.key,
    required this.text,
    this.normalTextStyle,
    this.islamicTextStyle,
    this.textAlign,
    this.textDirection,
    this.strutStyle,
    this.maxLines,
    this.overflow,
    this.enableFallback = true,
    this.islamicVerticalOffset = 0.0,
  });

  /// Original text containing Islamic phrases.
  final String text;

  /// Text style used for normal (non-ligature) text.
  final TextStyle? normalTextStyle;

  /// Optional overrides for Islamic ligature text.
  final TextStyle? islamicTextStyle;

  /// Vertical adjustment for Islamic ligatures.
  /// Useful for font baseline tuning.
  final double islamicVerticalOffset;

  /// Whether to gracefully fall back if the font is missing.
  final bool enableFallback;

  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final StrutStyle? strutStyle;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final replacer = LigatureReplacer();
    final encodedText = replacer.encode(text);

    final styleResolver = IslamicTextStyleResolver(
      context: context,
      normalStyle: normalTextStyle,
      islamicStyle: islamicTextStyle,
      verticalOffset: islamicVerticalOffset,
    );

    final spanBuilder = IslamicTextSpanBuilder(
      encodedText: encodedText,
      ligatureSymbols: replacer.symbols,
      normalStyle: styleResolver.normalStyle,
      islamicStyle: styleResolver.islamicStyle,
      verticalOffset: styleResolver.resolvedOffset,
    );

    return FutureBuilder(
      future: IslamicFontLoader.load(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          // Show placeholder while font is loading
          return Text('');
        }
        // Font loaded, build normally
        return Text.rich(
          TextSpan(children: spanBuilder.build()),
          textAlign: textAlign,
          textDirection: textDirection ?? Directionality.of(context),
          strutStyle: strutStyle,
          maxLines: maxLines,
          overflow: overflow,
        );
      },
    );
  }
}
