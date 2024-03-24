import 'package:flutter_wanikani/data/kanji_store.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';

class KanjiService {
  late final List<KanjiItem> _items;

  static Future<KanjiService> initialize(int level) async {
    var service = KanjiService();
    service._items = await KanjiStore.getItemsFor(level);
    return service;
  }

  KanjiItem? getNextItem() {
    if (_items.isEmpty) {
      return null;
    }
    return _items.removeAt(0);
  }
}