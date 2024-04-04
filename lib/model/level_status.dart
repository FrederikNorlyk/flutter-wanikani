import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/wanikani_colors.dart';

enum LevelStatus {
  unseen, seen, burnt
}

extension LevelStatusExtension on LevelStatus {
  String get kanji {
    switch (this) {
      case LevelStatus.unseen:
        return '新';
      case LevelStatus.seen:
        return '現';
      case LevelStatus.burnt:
        return '焦';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case LevelStatus.unseen:
        return WaniKaniColors.red.color;
      case LevelStatus.seen:
        return WaniKaniColors.blue.color;
      case LevelStatus.burnt:
        return WaniKaniColors.gray.color;
      default:
        return Colors.white;
    }
  }
}