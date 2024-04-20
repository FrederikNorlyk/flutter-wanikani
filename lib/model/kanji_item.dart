import 'package:flutter_wanikani/model/status.dart';
import 'package:flutter_wanikani/model/reading.dart';

class KanjiItem {
  final String _kanji;
  final String _primaryMeaning;
  late final List<String> _alternativeMeanings;
  late final List<Reading> _onYomiReadings;
  late final List<Reading> _kunYomiReadings;
  late final List<Reading> _nanoriReadings;
  Status status = Status.unseen;

  KanjiItem(
    this._kanji, 
    this._primaryMeaning, {
    required List<String> alternative, 
    required List<Reading> onYomi, 
    required List<Reading> kunYomi, 
    required List<Reading> nanori
  }) {
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

  List<String> get alternativeMeanings {
    return _alternativeMeanings;
  }

  List<Reading> get onYomiReadings {
    return _onYomiReadings;
  }

  List<Reading> get kunYomiReadings {
    return _kunYomiReadings;
  }

  List<Reading> get nanoriReadings {
    return _nanoriReadings;
  }
}