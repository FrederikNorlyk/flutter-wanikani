import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';

class QuestionWidget extends StatelessWidget {

  final KanjiItem _item;

  const QuestionWidget({super.key, required KanjiItem item}) : _item = item;

  @override
  Widget build(BuildContext context) {
    return Text(
      _item.kanji,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
      )
    );
  }
}