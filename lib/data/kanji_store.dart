import 'dart:convert';

import 'package:flutter_wanikani/data/level_1.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';

class KanjiStore {
  
  static List<KanjiItem> getItemsFor(int level) {
    String data;
    switch (level) {
      case 1:
        data = Level1.data;
        break;
      default:
        throw UnsupportedError("Invalid level: $level");
    }
    
    Map<String, dynamic> decoded = jsonDecode(data);
    List<KanjiItem> items = [];
    
    for (var entries in decoded['data']) {
      Map<String, dynamic> entry = entries[0];
      String kanji = entry['characters'];
      List<dynamic> meanings = entry['meanings'];
      
      late String primaryMeaning;
      List<String> alternativeMeanings = [];

      for (var meaning in meanings) {
        bool isPrimary = meaning['primary'];

        if (isPrimary) {
          primaryMeaning = meaning['meaning'];
        } else {
          alternativeMeanings.add(meaning['meaning']);
        }
      }

      List<dynamic> readings = entry['readings'];
      List<String> onYomiReadings = [];
      List<String> kunYomiReadings = [];
      List<String> nanoriReadings = [];

      for (var readingEntry in readings) {
        String type = readingEntry['type'];
        String reading = readingEntry['reading'];

        switch (type) {
          case "onyomi":
            onYomiReadings.add(reading);
          case "kunyomi":
            kunYomiReadings.add(reading);
          case "nanori":
            nanoriReadings.add(reading);
          default: 
            throw UnsupportedError("Invalid type: $type");
        }
      }

      items.add(KanjiItem(
        kanji, 
        primaryMeaning, 
        alternative: alternativeMeanings.join(", "), 
        onYomi: onYomiReadings.join(", "),
        kunYomi: kunYomiReadings.join(", "),
        nanori: nanoriReadings.join(", ")
      ));
    }

    return items;
  }
}