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
        child: CustomScrollView(
          slivers: _buildLevelGroups(context),
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

      // Label
      widgets.add(SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Text(group), 
          childCount: 1
        )
      ));

      // Buttons
      widgets.add(_buildLevelButtons(context, level));

      level += 10;
    }

    return widgets;
  }

  Widget _buildLevelButtons(BuildContext context, int startLevel) {

    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewWidget(level: startLevel + index)),
              ),
              child: Container(
                height: 50,
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                    (startLevel + index).toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ),
          childCount: 10
        ), 
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100
        )
      );
  }
}