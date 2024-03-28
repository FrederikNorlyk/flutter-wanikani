import 'package:flutter/material.dart';
import 'package:flutter_wanikani/widgets/review_widget.dart';

class LevelSelectorButton extends StatelessWidget {

  final int _level;

  const LevelSelectorButton({
    super.key,
    required int level
  }) : _level = level;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReviewWidget(level: _level)),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            // border: Border.all(
            //   width: 8,
            // ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              _level.toString().padLeft(2, "0"),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      );
  }
}