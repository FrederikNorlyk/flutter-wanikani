import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/model/reading.dart';

class AnswerWidget extends StatefulWidget {

  final KanjiItem item;

  const AnswerWidget({super.key, required this.item});

  @override
  State<StatefulWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _getTextRow(widget.item.kanji, 60, fontWeight: FontWeight.bold),
        _getTextRow(widget.item.primaryMeaning, 40),
        _getTextRow(widget.item.alternativeMeanings.join(", "), 30),
        _getReadingWidget(widget.item.onYomiReadings),
        _getReadingWidget(widget.item.kunYomiReadings),
        _getReadingWidget(widget.item.nanoriReadings),
      ]
    );
  }

  Text _getReadingWidget(List<Reading> readings) {
    var text = "";
    var isPrimary = false;
    if (readings.isNotEmpty) {
      text = readings.map((e) => e.text).join(", ");
      isPrimary = readings[0].isPrimary;
    }

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: isPrimary ? Theme.of(context).colorScheme.onBackground : Colors.black45
      )
    );
  }

  Text _getTextRow(String text, double? fontSize, {FontWeight fontWeight = FontWeight.normal}) {
    return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Theme.of(context).colorScheme.onBackground
        )
    );
  }
}