import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/model/reading.dart';

class KanjiStore {
  
  static Future<List<KanjiItem>> getItemsFor(int level) async {
    final String json = await rootBundle.loadString('assets/levels/$level.json');
    
    Map<String, dynamic> decoded = jsonDecode(json);
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
      List<Reading> onYomiReadings = [];
      List<Reading> kunYomiReadings = [];
      List<Reading> nanoriReadings = [];

      for (var readingEntry in readings) {
        var reading = Reading(
          readingEntry['reading'],
          isPrimary: readingEntry['primary']
        );

        String type = readingEntry['type'];
        
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
        alternative: alternativeMeanings, 
        onYomi: onYomiReadings,
        kunYomi: kunYomiReadings,
        nanori: nanoriReadings
      ));
    }

    return items;
  }
}