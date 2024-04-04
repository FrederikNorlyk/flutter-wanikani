import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/service/kanji_service.dart';
import 'package:flutter_wanikani/widgets/kanji_item_widget.dart';
import 'package:flutter_wanikani/widgets/level_completed_widget.dart';

class ReviewWidget extends StatefulWidget {

  const ReviewWidget({
    super.key,
    required int level,
  }) : _level = level;

  final int _level;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {

  KanjiService? _kanjiService;
  bool _isShowingAnswer = false;
  KanjiItem? _item;

  @override
  initState() {
    super.initState();

    KanjiService.initialize(widget._level).then((KanjiService kanjiService) {
      setState(() {
        _kanjiService = kanjiService;
        _item = _kanjiService!.getNextItem()!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if (_kanjiService == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Loading..."),
        ),
      );
    }

    var noMoreItems = _item == null;

    return Scaffold(
      appBar: AppBar(title: Text('Level ${widget._level}'), centerTitle: true),
      body: Container(
        color: Colors.white, 
        child: noMoreItems 
          ? LevelCompletedWidget(level: widget._level) 
          : KanjiItemWidget(item: _item!, isShowingAnswer: _isShowingAnswer, nextButtonPressed: _nextButtonPressed)
      )
    );
  }

  void _nextButtonPressed(BuildContext context) {
    setState(() {
      if (_isShowingAnswer) {
        _item = _kanjiService?.getNextItem();
      }

      _isShowingAnswer = !_isShowingAnswer;
    });
  }
}