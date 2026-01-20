import 'package:flutter/material.dart';
import 'package:islamic_text/src/utils/font_loader.dart';

/// Resolves effective text styles and font metrics
/// for Islamic ligatures and normal text.
class IslamicTextStyleResolver {
  IslamicTextStyleResolver({
    required BuildContext context,
    TextStyle? normalStyle,
    TextStyle? islamicStyle,
  }) : normalStyle = normalStyle ?? DefaultTextStyle.of(context).style,
       islamicStyle = _resolveIslamicStyle(
         base: normalStyle ?? DefaultTextStyle.of(context).style,
         override: islamicStyle,
       );

  /// Style for normal text segments.
  final TextStyle normalStyle;

  /// Style for Islamic ligatures or glyphs.
  final TextStyle islamicStyle;

  static TextStyle _resolveIslamicStyle({
    required TextStyle base,
    TextStyle? override,
  }) {
    final merged = base.merge(override);
    if (!IslamicTextFontLoader.isLoaded) {
      return merged;
    }
    final baseFontSize = base.fontSize ?? 14.0;
    return merged.copyWith(
      fontFamily: 'IslamicPhrases',
      fontSize: override?.fontSize ?? baseFontSize * 1.25,
    );
  }
}
