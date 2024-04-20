import 'package:flutter/material.dart';
import 'package:flutter_wanikani/main.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/model/reading.dart';
import 'package:flutter_wanikani/enum/status.dart';
import 'package:flutter_wanikani/enum/wanikani_colors.dart';
import 'package:provider/provider.dart';

class AnswerWidget extends StatelessWidget {

  final int _currentLevel;
  final KanjiItem _item;
  final Function _nextButtonPressed;

  const AnswerWidget({
    super.key, 
    required KanjiItem item,
    required int currentLevel,
    required Function nextButtonPressed
  }) : 
  _item = item,
  _currentLevel = currentLevel,
  _nextButtonPressed = nextButtonPressed;

  @override
  Widget build(BuildContext context) {

    var keepButton = Expanded(
      child: TextButton(
        onPressed: () => _buttonPressed(context, Status.seen), 
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 40),
          backgroundColor: WaniKaniColors.blue.color,
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: const Text('Keep'),
      ),
    );

    var burnButton = Expanded(
      child: TextButton(
        onPressed: () => _buttonPressed(context, Status.burnt), 
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 40),
          backgroundColor: WaniKaniColors.gray.color,
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: const Text('Burn'),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _getTextRow(_item.kanji, fontSize: 60),
              _getTextRow(_item.primaryMeaning, fontSize: 40),
              _getTextRow(_item.alternativeMeanings.join(", "), fontSize: 30),
              _getReadingWidget(_item.onYomiReadings),
              _getReadingWidget(_item.kunYomiReadings),
              _getReadingWidget(_item.nanoriReadings),
            ]
          ),
        ),
        SizedBox(
          height: 150, 
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              keepButton,
              burnButton
            ]
          )
        )
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

  void _buttonPressed(BuildContext context, Status status) {
    var state = Provider.of<MyAppState>(context, listen: false);
    state.setKanjiStatus(_currentLevel, _item, status);
    _nextButtonPressed();
  }
}