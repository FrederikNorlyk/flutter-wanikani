import 'package:flutter/material.dart';
import 'package:flutter_wanikani/main.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/model/status.dart';
import 'package:flutter_wanikani/service/kanji_service.dart';
import 'package:provider/provider.dart';

import 'answer_widget.dart';
import 'question_widget.dart';

class ReviewWidget extends StatefulWidget {

  final int _level;

  const ReviewWidget({
    super.key,
    required int level,
  }) : _level = level;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {

  KanjiService? _kanjiService;
  bool _isShowingAnswer = false;
  KanjiItem? _item;

  @override
  Widget build(BuildContext context) {
    
    if (_kanjiService == null) {
      final MyAppState state = context.watch<MyAppState>();
      final items = state.getItems(widget._level);
      final pendingItems = items.where((element) => element.status != Status.burnt).toList();
      
      if (pendingItems.isNotEmpty) {
        _kanjiService = KanjiService(pendingItems);
      } else {
        _kanjiService = KanjiService(items);
      }
      
      _item = _kanjiService!.getNextItem();
    }

    var noMoreItems = _item == null;
    if (noMoreItems) {
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(title: Text('Level ${widget._level}'), centerTitle: true),
      body: Container(
        color: Colors.white, 
        child: _isShowingAnswer 
          ? AnswerWidget(item: _item!, currentLevel: widget._level, nextButtonPressed: _nextButtonPressed) 
          : QuestionWidget(item: _item!, nextButtonPressed: _nextButtonPressed)
      )
    );
  }

  void _nextButtonPressed(BuildContext context) {
    setState(() {
      if (_isShowingAnswer) {
        _item = _kanjiService!.getNextItem();
      }

      _isShowingAnswer = !_isShowingAnswer;
    });
  }
}