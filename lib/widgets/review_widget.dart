import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/service/kanji_service.dart';

class ReviewWidget extends StatefulWidget {

  const ReviewWidget({
    super.key,
    required this.level,
  });

  final int level;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState(this);
}

class _ReviewWidgetState extends State<ReviewWidget> {

  late final KanjiService _kanjiService;
  bool _isShowingAnswer = false;
  late KanjiItem _item;

  _ReviewWidgetState(ReviewWidget widget) {
    _kanjiService = KanjiService(widget.level);
    _item = _kanjiService.getNextItem()!;
  }

  @override
  Widget build(BuildContext context) {
    
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      _isShowingAnswer ? _item.primaryMeaning : _item.kanji,
                      style: const TextStyle(
                        fontSize: 100,
                        color: Colors.black
                      )
                    )
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      _isShowingAnswer ? _item.alternativeMeanings.join(", ") : "",
                      style: const TextStyle(
                        fontSize: 60,
                        color: Colors.black
                      ),
                    )
                  )
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

  void _nextButtonPressed(BuildContext context) {
    setState(() {
      if (_isShowingAnswer) {
        var item = _kanjiService.getNextItem();

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