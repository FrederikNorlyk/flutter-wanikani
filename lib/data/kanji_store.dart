import 'package:flutter_wanikani/model/kanji_item.dart';

class KanjiStore {
  
  static List<KanjiItem> getItemsFor(int level) {
    switch (level) {
      case 1:
        return [
          KanjiItem("上", "Above", alternative: "Up, Over", onYomi: "じょう", kunYomi: "うえ, あ, のぼ, うわ, かみ"),
          KanjiItem("下", "Below", alternative: "Down, Under, Beneath", onYomi: "か, げ", kunYomi: "した, さ, くだ, お, しも, もと")
        ];
        default:
          throw UnsupportedError("Invalid level: $level");
    }
  }
}