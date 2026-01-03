import 'package:flutter/material.dart';

/// Resolves effective text styles and font metrics
/// for Islamic ligatures and normal text.
class IslamicTextStyleResolver {
  IslamicTextStyleResolver({
    required BuildContext context,
    TextStyle? normalStyle,
    TextStyle? islamicStyle,
    required this.verticalOffset,
    required this.enableFont,
  }) : normalStyle = normalStyle ?? DefaultTextStyle.of(context).style,
       islamicStyle = _resolveIslamicStyle(
         base: normalStyle ?? DefaultTextStyle.of(context).style,
         override: islamicStyle,
         enableFont: enableFont,
       );

  final bool enableFont;

  /// Style for normal text segments.
  final TextStyle normalStyle;

  /// Style for Islamic ligatures or glyphs.
  final TextStyle islamicStyle;

  /// Vertical offset requested by the user.
  final double verticalOffset;

  double get resolvedOffset =>
      enableFont ? (verticalOffset + 0.15) * islamicStyle.fontSize! : 0.0;

  static TextStyle _resolveIslamicStyle({
    required TextStyle base,
    TextStyle? override,
    required bool enableFont,
  }) {
    final baseFontSize = base.fontSize ?? 14.0;
    if (!enableFont) {
      // Fallback: no custom font, no scaling
      return base.merge(override);
    }
    return base
        .merge(override)
        .copyWith(
          fontFamily: 'IslamicPhrases',
          fontSize: override?.fontSize ?? baseFontSize * 1.25,
        );
  }
}
