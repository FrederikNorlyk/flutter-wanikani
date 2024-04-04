import 'package:flutter/material.dart';

enum WaniKaniColors {
  gray,
  blue,
  pink
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
      default:
        return Colors.white;
    }
  }
}