import 'package:flutter/material.dart';
import 'package:flutter_wanikani/main.dart';
import 'package:flutter_wanikani/model/level_status.dart';
import 'package:flutter_wanikani/widgets/review_widget.dart';
import 'package:provider/provider.dart';

class LevelSelectorButton extends StatelessWidget {
  
  final int _level;

  const LevelSelectorButton({
    super.key,
    required int level
  }) : _level = level;

  @override
  Widget build(BuildContext context) {

    final MyAppState state = context.watch<MyAppState>();
    final LevelStatus status = state.getLevelStatus(_level);
    
    return FilledButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewWidget(level: _level)),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          )
        )
      ),
      child: Text(
        _level.toString().padLeft(2, "0") + (status.name),
        style: const TextStyle(fontSize: 20),
      )
    );
  }
}