import 'package:flutter/material.dart';
import 'package:flutter_wanikani/main.dart';
import 'package:flutter_wanikani/model/level_status.dart';
import 'package:flutter_wanikani/model/wanikani_colors.dart';
import 'package:provider/provider.dart';

class LevelCompletedWidget extends StatelessWidget {

  final int _level;

  const LevelCompletedWidget({
    super.key, 
    required int level, 
  }) : 
  _level = level;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 1,
          child: Center(
            child: Text('How did you do?', style: TextStyle(fontSize: 40))
          )
        ),
        SizedBox(
          height: 300,
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildButton('I need more practice', LevelStatus.seen, context, WaniKaniColors.blue.color),
              _buildButton('Mark as burnt', LevelStatus.burnt, context, WaniKaniColors.gray.color),
            ]
          )
        )
      ],
    );
  }

  Widget _buildButton(String text, LevelStatus status, BuildContext context, Color color) {
    return Expanded(
      flex: 1,
      child: TextButton(
        onPressed: () => _completeLevel(status, context),
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 40),
          backgroundColor: color,
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Text(text, textAlign: TextAlign.center)
      ),
    );
  }

  void _completeLevel(LevelStatus status, BuildContext context) {
    var state = Provider.of<MyAppState>(context, listen: false);
    state.setLevelStatus(_level, status);
    Navigator.of(context).pop();
  }
}