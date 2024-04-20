import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/model/status.dart';

class Level {
  final int _level;
  final List<KanjiItem> _kanjiItems;

  Level(this._level, this._kanjiItems);

  int get level {
    return _level;
  }

  Status get status {
    if (_kanjiItems.any((item) => item.status == Status.unseen)) {
      return Status.unseen;
    }
    if (_kanjiItems.any((item) => item.status == Status.seen)) {
      return Status.seen;
    }
    return Status.burnt;
  }

  List<KanjiItem> get kanjiItems {
    return _kanjiItems;
  }

  void setKanjiItemStatus(KanjiItem item, Status status) {
    var kanjiItem = _kanjiItems.firstWhere((kanjiItem) => kanjiItem.kanji == item.kanji);
    kanjiItem.status = status;
  }
}