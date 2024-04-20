import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/enum/status.dart';

class Level {
  final int _level;
  final List<KanjiItem> _kanjiItems;

  Level(this._level, this._kanjiItems);

  int get level {
    return _level;
  }

  Status get status {
    var allAreUnseen = true;
    var allAreBurnt = true;

    for (var item in _kanjiItems) {
      switch (item.status) {
        case Status.seen:
          return Status.seen;
        case Status.burnt:
          allAreUnseen = false;
          break;
        case Status.unseen:
          allAreBurnt = false;
      }
    }
    
    if (allAreBurnt) {
      return Status.burnt;
    } else if (allAreUnseen) {
      return Status.unseen;
    } else {
      return Status.seen;
    }
  }

  List<KanjiItem> get kanjiItems {
    return _kanjiItems;
  }

  void setKanjiItemStatus(KanjiItem item, Status status) {
    var kanjiItem = _kanjiItems.firstWhere((kanjiItem) => kanjiItem.kanji == item.kanji);
    kanjiItem.status = status;
  }
}