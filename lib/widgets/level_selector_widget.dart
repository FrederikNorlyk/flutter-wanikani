import 'package:flutter/material.dart';
import 'package:flutter_wanikani/main.dart';
import 'package:flutter_wanikani/enum/wanikani_colors.dart';
import 'package:flutter_wanikani/widgets/level_selector_button.dart';
import 'package:provider/provider.dart';

class LevelSelectorWidget extends StatelessWidget {

  const LevelSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Select a level'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10), 
        child: CustomScrollView(
          clipBehavior: Clip.none,
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

    widgets.add(_buildBottomSpacing(context));

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

  SliverList _buildBottomSpacing(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 3,
        (context, index) => index == 1 ? _getResetButton(context) : const SizedBox(height: 40)
      )
    );
  }

  FilledButton _getResetButton(BuildContext context) {
    return FilledButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => _getDialog(context)
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(WaniKaniColors.red.color),
      ),
      child: const Text('Reset'),
    );
  }

  AlertDialog _getDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset state'),
      content: const Text('Are you sure?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => _resetState(context),
          child: const Text('OK'),
        ),
      ]
    );
  }

  void _resetState(BuildContext context) {
    MyAppState state = Provider.of<MyAppState>(context, listen: false);
    state.resetState();
    Navigator.pop(context, 'OK');
  }
}