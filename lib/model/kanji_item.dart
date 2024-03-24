class KanjiItem {
  final String _kanji;
  final String _primaryMeaning;
  final List<String> _alternativeMeanings;

  KanjiItem(this._kanji, this._primaryMeaning, this._alternativeMeanings);

  String get kanji {
    return _kanji;
  }

  String get primaryMeaning {
    return _primaryMeaning;
  }

  List<String> get alternativeMeanings {
    return _alternativeMeanings;
  }
}