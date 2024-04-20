import 'package:flutter/material.dart';
import 'package:flutter_wanikani/main.dart';
import 'package:flutter_wanikani/model/status.dart';
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
    final Status status = state.getLevelStatus(_level);
    
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildButton(context),
        _buildStatusBadge(status)
      ]
    );
  }

  SizedBox _buildButton(BuildContext context) {
    return SizedBox.expand(
      child: FilledButton(
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
          _level.toString().padLeft(2, "0"),
          style: const TextStyle(fontSize: 20),
        )
      )
    );
  }

  Widget _buildStatusBadge(Status status) {
    return Positioned(
      top: -4,
      right: -4,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: status.color,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 0,
              blurRadius: 1,
              offset: Offset(0, 0.5),
            ),
          ]
        ),
        child: Center(
          child: Text(
            status.kanji,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
          )
        )
      ),
    );
  }
}