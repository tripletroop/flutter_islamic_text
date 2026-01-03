import 'package:flutter/material.dart';

/// Resolves effective text styles and font metrics
/// for Islamic ligatures and normal text.
class IslamicTextStyleResolver {
  IslamicTextStyleResolver({
    required BuildContext context,
    TextStyle? normalStyle,
    TextStyle? islamicStyle,
    required this.verticalOffset,
  }) : normalStyle = normalStyle ?? DefaultTextStyle.of(context).style,
       islamicStyle = _resolveIslamicStyle(
         base: normalStyle ?? DefaultTextStyle.of(context).style,
         override: islamicStyle,
       );

  /// Style for normal text segments.
  final TextStyle normalStyle;

  /// Style for Islamic ligatures or glyphs.
  final TextStyle islamicStyle;

  /// Vertical offset requested by the user.
  final double verticalOffset;

  double get resolvedOffset => (verticalOffset + 0.15) * islamicStyle.fontSize!;

  static TextStyle _resolveIslamicStyle({
    required TextStyle base,
    TextStyle? override,
  }) {
    final baseFontSize = base.fontSize ?? 14.0;
    return base
        .merge(override)
        .copyWith(
          fontFamily: 'IslamicPhrases',
          fontSize: override?.fontSize ?? baseFontSize * 1.25,
        );
  }
}
