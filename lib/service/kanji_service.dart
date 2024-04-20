import 'package:flutter_wanikani/model/kanji_item.dart';

class KanjiService {
  late final List<KanjiItem> _items;

  KanjiService(List<KanjiItem> items) : _items = items;

  KanjiItem? getNextItem() {
    if (_items.isEmpty) {
      return null;
    }
    return _items.removeAt(0);
  }
}