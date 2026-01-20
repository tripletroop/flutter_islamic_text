/// Replaces well-known Islamic phrases with private-use
/// placeholder symbols for later ligature rendering.
///
/// This class performs **lossless, reversible** transformations.
///
/// Design guarantees:
/// - Deterministic replacement order
/// - No accidental decoding of user input
/// - Immutable internal mapping
class LigatureReplacer {
  /// Private placeholder symbols mapped to their phrases.
  ///
  /// Symbols are intentionally chosen from a non-used Unicodes that preset in the font file
  /// block to avoid collisions with real text.
  static const Map<String, String> _puaMap = {
    '\uE001': 'جل جلاله',
    '\uE002': 'عز وجل',
    '\uE003': 'رضي الله عنهما',
    '\uE004': 'رضي الله عنهم',
    '\uE005': 'رضي الله عنها',
    '\uE006': 'رضي الله عنه',
    '\uE007': 'سبحانه وتعالى',
    '\uE008': 'عليه السلام',
    '\uE009': 'صلى الله عليه وسلم',
  };

  /// Replaces phrases with internal placeholder symbols.
  String encode(String input) {
    var output = input;
    for (final entry in _puaMap.entries) {
      output = output.replaceAll(entry.value, entry.key);
    }
    return output;
  }

  /// Restores placeholder symbols back to their full phrases.
  ///
  /// Intended mainly for debugging or serialization.
  String decode(String input) {
    var output = input;
    for (final entry in _puaMap.entries) {
      output = output.replaceAll(entry.key, entry.value);
    }
    return output;
  }

  /// Returns all placeholder symbols used internally.
  List<String> get symbols => _puaMap.keys.toList(growable: false);
}
