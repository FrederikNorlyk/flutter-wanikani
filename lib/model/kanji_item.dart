class KanjiItem {
  final String _kanji;
  final String _primaryMeaning;
  late final String? _alternativeMeanings;
  late final String? _onYomiReadings;
  late final String? _kunYomiReadings;
  late final String? _nanoriReadings;

  KanjiItem(this._kanji, this._primaryMeaning, {String? alternative, String? onYomi, String? kunYomi, String? nanori}) {
    _alternativeMeanings = alternative;
    _onYomiReadings = onYomi;
    _kunYomiReadings = kunYomi;
    _nanoriReadings = nanori;
  }

  String get kanji {
    return _kanji;
  }

  String get primaryMeaning {
    return _primaryMeaning;
  }

  String? get alternativeMeanings {
    return _alternativeMeanings;
  }

  String? get onYomiReadings {
    return _onYomiReadings;
  }

  String? get kunYomiReadings {
    return _kunYomiReadings;
  }

  String? get nanoriReadings {
    return _nanoriReadings;
  }
}