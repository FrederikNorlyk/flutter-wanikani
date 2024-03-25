import 'package:flutter/material.dart';
import 'package:flutter_wanikani/widgets/review_widget.dart';

class LevelSelectorWidget extends StatelessWidget {

  const LevelSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Select a level'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10), 
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildLevelGroups(context),
        )
      )
    );
  }

  List<Widget> _buildLevelGroups(BuildContext context) {

    List<Widget> widgets = [];

    var groups = [
      "快 PLEASANT",
      "苦 PAINFUL",
      "死 DEATH",
      "地獄 HELL",
      "天国 PARADISE",
      "現実 REALITY"
    ];

    var level = 1;

    for (var group in groups) {
      widgets.add(Text(group));
      widgets.add(_buildLevelButtons(context, level));

      level += 10;
    }

    return widgets;
  }

  Widget _buildLevelButtons(BuildContext context, int startLevel) {

    List<Widget> children = [];

    for (var i = startLevel; i <= startLevel + 9; i++) {
      children.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewWidget(level: i)),
              ),
              child: Container(
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                    i.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ),
        ),
      );
    }

    return Flex(
      direction: Axis.horizontal,
      children: children,
    );
  }
}