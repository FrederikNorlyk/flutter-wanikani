import 'package:flutter/material.dart';
import 'package:flutter_wanikani/main.dart';
import 'package:flutter_wanikani/enum/status.dart';
import 'package:flutter_wanikani/enum/wanikani_colors.dart';
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
    
    List<Widget> children = [_buildButton(context, status)];

    if (status == Status.unseen) {
      children.add(_buildUnseenStatus());
    }

    return Stack(
      clipBehavior: Clip.none,
      children: children
    );
  }

  SizedBox _buildButton(BuildContext context, Status status) {
    return SizedBox.expand(
      child: FilledButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReviewWidget(level: _level)),
        ),
        style: ButtonStyle(
          backgroundColor: status == Status.burnt ? MaterialStateProperty.all(WaniKaniColors.gray.color) : null,
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

  Widget _buildUnseenStatus() {
    return Positioned(
      top: -4,
      right: -4,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: WaniKaniColors.red.color,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 0,
              blurRadius: 1,
              offset: Offset(0, 0.5),
            ),
          ]
        ),
        child: const Center(
          child: Text(
            '新',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
          )
        )
      ),
    );
  }
}