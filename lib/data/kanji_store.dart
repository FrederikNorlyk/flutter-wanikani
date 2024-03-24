import 'package:flutter_wanikani/model/kanji_item.dart';

class KanjiStore {
  
  static List<KanjiItem> getItemsFor(int level) {
    switch (level) {
      case 1:
        return [
          KanjiItem("上", "Above", ["Up", "Over"]),
          KanjiItem("下", "Below", ["Down", "Under", "Beneath"])
        ];
        default:
          throw UnsupportedError("Invalid level: $level");
    }
  }
}