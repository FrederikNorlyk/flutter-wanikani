import 'package:flutter/material.dart';
import 'package:flutter_wanikani/widgets/review_widget.dart';

class LevelSelectorWidget extends StatelessWidget {

  const LevelSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a level'), centerTitle: true),
      body: ListView.builder(
        itemCount: 60,
        itemBuilder: (_, int index) {
          final int level = index + 1;

          return ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewWidget(level: level)),
                ),
              title: Text('Level $level'));
        }),
    );
  }
}