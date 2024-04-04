import 'package:flutter/material.dart';

enum WaniKaniColors {
  gray,
  blue,
  pink,
  red
}

extension WaniKaniColorsExtension on WaniKaniColors {
  Color get color {
    switch (this) {
      case WaniKaniColors.gray:
        return const Color(0xFF555555);
      case WaniKaniColors.blue:
        return const Color(0xFF3CaBFF);
      case WaniKaniColors.pink:
        return const Color(0xFFFF00AA);
      case WaniKaniColors.red:
        return const Color(0xFFff0033);
      default:
        return Colors.white;
    }
  }
}