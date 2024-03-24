import 'package:flutter_wanikani/data/kanji_store.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';

class KanjiService {
  late final List<KanjiItem> _items;

  KanjiService(int level) {
    _items = KanjiStore.getItemsFor(level);
  }

  KanjiItem? getNextItem() {
    if (_items.isEmpty) {
      return null;
    }
    return _items.removeAt(0);
  }
}