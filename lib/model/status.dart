import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/wanikani_colors.dart';

enum Status {
  unseen, seen, burnt
}

extension LevelStatusExtension on Status {
  String get kanji {
    switch (this) {
      case Status.unseen:
        return '新';
      case Status.seen:
        return '現';
      case Status.burnt:
        return '焦';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case Status.unseen:
        return WaniKaniColors.red.color;
      case Status.seen:
        return WaniKaniColors.blue.color;
      case Status.burnt:
        return WaniKaniColors.gray.color;
      default:
        return Colors.white;
    }
  }
}