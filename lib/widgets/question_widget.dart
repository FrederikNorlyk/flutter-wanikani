import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';

class QuestionWidget extends StatefulWidget {

  final KanjiItem item;

  const QuestionWidget({super.key, required this.item});

  @override
  State<StatefulWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
 
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        widget.item.kanji,
        style: const TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
        )
      )
    );
  }
}