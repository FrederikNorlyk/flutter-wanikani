import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/widgets/answer_widget.dart';
import 'package:flutter_wanikani/widgets/question_widget.dart';

class KanjiItemWidget extends StatelessWidget {
  
  final KanjiItem _item;
  final int _currentLevel;
  final bool _isShowingAnswer;
  final Function _nextButtonPressed;

  const KanjiItemWidget({
    super.key, 
    required KanjiItem item,
    required int currentLevel,
    required bool isShowingAnswer, 
    required Function nextButtonPressed
  }) : 
  _item = item,
  _currentLevel = currentLevel,
  _isShowingAnswer = isShowingAnswer, 
  _nextButtonPressed = nextButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _isShowingAnswer 
            ? AnswerWidget(item: _item, currentLevel: _currentLevel, nextButtonPressed: _nextButtonPressed) 
            : QuestionWidget(item: _item, nextButtonPressed: _nextButtonPressed)
        )
      ]
    );
  }
}