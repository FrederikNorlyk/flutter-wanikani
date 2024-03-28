import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/model/reading.dart';

class AnswerWidget extends StatelessWidget {

  final KanjiItem _item;

  const AnswerWidget({super.key, required KanjiItem item}) : _item = item;

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _getTextRow(_item.kanji, fontSize: 60),
        _getTextRow(_item.primaryMeaning, fontSize: 40),
        _getTextRow(_item.alternativeMeanings.join(", "), fontSize: 30),
        _getReadingWidget(_item.onYomiReadings),
        _getReadingWidget(_item.kunYomiReadings),
        _getReadingWidget(_item.nanoriReadings),
      ]
    );
  }

  Text _getTextRow(String text, {double? fontSize}) {
    return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize
        )
    );
  }

  Text _getReadingWidget(List<Reading> readings) {
    final bool isPrimaryReading = readings.any((reading) => reading.isPrimary);
    final String text = readings.map((reading) => reading.text).join(", ");

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        color: isPrimaryReading ? null : Colors.black45
      )
    );
  }
}