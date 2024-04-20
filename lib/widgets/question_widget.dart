import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/model/wanikani_colors.dart';

class QuestionWidget extends StatelessWidget {

  final KanjiItem _item;
  final Function _nextButtonPressed;

  const QuestionWidget({
    super.key, 
    required KanjiItem item,
    required Function nextButtonPressed
  }) : 
  _item = item,
  _nextButtonPressed = nextButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Text(
            _item.kanji,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 60,
            )
          ),
        ),
        SizedBox(
          height: 150, 
          child: TextButton(
            onPressed: () => _nextButtonPressed(context), 
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 40),
              backgroundColor: WaniKaniColors.pink.color,
              foregroundColor: Theme.of(context).colorScheme.onSecondary,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            child: const Text('Next'),
          )
        )
      ]
    );
  }
}