import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/widgets/answer_widget.dart';
import 'package:flutter_wanikani/widgets/question_widget.dart';

class KanjiItemWidget extends StatelessWidget {
  
  final KanjiItem _item;
  final bool _isShowingAnswer;
  final Function _nextButtonPressed;

  const KanjiItemWidget({
    super.key, 
    required KanjiItem item,
    required bool isShowingAnswer, 
    required Function nextButtonPressed
  }) : 
  _item = item,
  _isShowingAnswer = isShowingAnswer, 
  _nextButtonPressed = nextButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: _isShowingAnswer ? AnswerWidget(item: _item) : QuestionWidget(item: _item)),
        SizedBox(
          height: 150, 
          child: TextButton(
            onPressed: () => _nextButtonPressed(context), 
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 40),
              backgroundColor: Theme.of(context).colorScheme.secondary,
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