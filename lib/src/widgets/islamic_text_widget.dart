import 'package:flutter/material.dart';
import 'package:islamic_text/src/utils/font_guard.dart';
import 'package:islamic_text/src/utils/islamic_text_span_builder.dart';
import 'package:islamic_text/src/style/islamic_text_style_resolver.dart';

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
    this.islamicVerticalOffset = 0.0,
    this.softWrap,
    this.textScaler,
    this.locale,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.semanticsLabel,
    this.semanticsIdentifier,
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

  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final StrutStyle? strutStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final TextScaler? textScaler;
  final Locale? locale;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final String? semanticsLabel;
  final String? semanticsIdentifier;

  @override
  Widget build(BuildContext context) {
    IslamicTextFontGuard.assertLoaded();

    final styleResolver = IslamicTextStyleResolver(
      context: context,
      normalStyle: normalTextStyle,
      islamicStyle: islamicTextStyle,
      verticalOffset: islamicVerticalOffset,
    );

    final spanBuilder = IslamicTextSpanBuilder(
      text: text,
      normalStyle: styleResolver.normalStyle,
      islamicStyle: styleResolver.islamicStyle,
      verticalOffset: styleResolver.resolvedOffset,
    );
    return Text.rich(
      TextSpan(children: spanBuilder.build()),
      textAlign: textAlign,
      textDirection: textDirection ?? Directionality.of(context),
      strutStyle: strutStyle,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textScaler: textScaler,
      locale: locale,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      semanticsIdentifier: semanticsIdentifier,
    );
  }
}
