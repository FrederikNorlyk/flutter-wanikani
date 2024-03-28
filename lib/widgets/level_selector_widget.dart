import 'package:flutter/material.dart';
import 'package:flutter_wanikani/widgets/level_selector_button.dart';

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
      widgets.add(_buildLabel(group));
      widgets.add(_buildButtonGrid(level));

      level += 10;
    }

    return widgets;
  }

  SliverList _buildLabel(String group) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => index == 0 
          ? const SizedBox(height: 10) 
          : Text(group),
        childCount: 2
      ),
    );
  }

  SliverGrid _buildButtonGrid(int startLevel) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => LevelSelectorButton(level: startLevel + index),
        childCount: 10
      ), 
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10
      )
    );
  }
}