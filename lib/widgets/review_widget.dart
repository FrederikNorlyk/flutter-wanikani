import 'package:flutter/material.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/service/kanji_service.dart';
import 'package:flutter_wanikani/widgets/answer_widget.dart';
import 'package:flutter_wanikani/widgets/question_widget.dart';

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
      appBar: AppBar(title: Text('Level ${widget.level}'), centerTitle: true),
      body: Container(
        color: Colors.white, 
        child: Column(
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