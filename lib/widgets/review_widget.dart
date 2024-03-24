import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/service/kanji_service.dart';

class ReviewWidget extends StatefulWidget {

  const ReviewWidget({
    super.key,
    required this.level,
  });

  final int level;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {

  KanjiService? _kanjiService;
  bool _isShowingAnswer = false;
  late KanjiItem _item;

  @override
  initState() {
    super.initState();

    KanjiService.initialize(widget.level).then((KanjiService value) {
      setState(() {
        _kanjiService = value;
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

    return Scaffold(
      appBar: AppBar(title: const Text('Select a level'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(color: Colors.white),
          ),
          Expanded(
            flex: 9,
            child: Container(
              color: Colors.white,
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _getTextRow(_isShowingAnswer ? _item.primaryMeaning : _item.kanji, 100),
                  _getTextRow(_isShowingAnswer ? _item.alternativeMeanings ?? "" : "", 60),
                  _getTextRow(_isShowingAnswer ? _item.onYomiReadings ?? "" : "", 40),
                  _getTextRow(_isShowingAnswer ? _item.kunYomiReadings ?? "" : "", 40),
                  _getTextRow(_isShowingAnswer ? _item.nanoriReadings ?? "" : "", 40),
                ]
              )
            )
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () => _nextButtonPressed(context), 
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 40),
              ),
              child: const Text('Next'),
            )
          )
        ]
      )
    );
  }

  Align _getTextRow(String text, double? fontSize) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black
        )
      )
    );
  }

  void _nextButtonPressed(BuildContext context) {
    setState(() {
      if (_isShowingAnswer) {
        var item = _kanjiService?.getNextItem();

        if (item == null) {
          Navigator.of(context).pop();
          return;
        }
        
        _item = item;
      }

      _isShowingAnswer = !_isShowingAnswer;
    });
  }
}