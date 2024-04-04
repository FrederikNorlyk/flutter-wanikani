import 'package:flutter/material.dart';
import 'package:flutter_wanikani/main.dart';
import 'package:flutter_wanikani/widgets/level_selector_button.dart';
import 'package:provider/provider.dart';

class LevelSelectorWidget extends StatelessWidget {

  LevelSelectorWidget({super.key});

  var _didInitializeState = false;

  @override
  Widget build(BuildContext context) {

    if (!_didInitializeState) {
      final state = context.watch<MyAppState>();
      state.initialize();
      _didInitializeState = true;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Select a level'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10), 
        child: CustomScrollView(
          slivers: _buildLevelGroups(context),
        )
      )
    );
  }

  List<Widget> _buildLevelGroups(BuildContext context) {

    final List<Widget> widgets = [];

    final List<String> groups = [
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

    widgets.add(_buildBottomSpacing());

    return widgets;
  }

  SliverList _buildLabel(String group) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 2,
        (context, index) => index == 0 
          ? const SizedBox(height: 10) 
          : Text(group)
      )
    );
  }

  SliverGrid _buildButtonGrid(int startLevel) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => LevelSelectorButton(level: startLevel + index)
      ), 
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10
      )
    );
  }

  SliverList _buildBottomSpacing() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (context, index) => const SizedBox(height: 40)
      )
    );
  }
}