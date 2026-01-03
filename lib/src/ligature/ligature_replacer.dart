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
  static const Map<String, String> _symbolToPhrase = {
    '丁': 'جل جلاله',
    '丂': 'عز وجل',
    '丅': 'رضي الله عنهما',
    '丆': 'رضي الله عنهم',
    '丄': 'رضي الله عنها',
    '七': 'رضي الله عنه',
    '万': 'سبحانه وتعالى',
    '丈': 'عليه السلام',
    '三': 'صلى الله عليه وسلم',
  };

  /// Replaces phrases with internal placeholder symbols.
  String encode(String input) {
    var output = input;
    for (final entry in _symbolToPhrase.entries) {
      output = output.replaceAll(entry.value, entry.key);
    }
    return output;
  }

  /// Restores placeholder symbols back to their full phrases.
  ///
  /// Intended mainly for debugging or serialization.
  String decode(String input) {
    var output = input;
    for (final entry in _symbolToPhrase.entries) {
      output = output.replaceAll(entry.key, entry.value);
    }
    return output;
  }

  /// Returns all placeholder symbols used internally.
  List<String> get symbols => _symbolToPhrase.keys.toList(growable: false);
}
