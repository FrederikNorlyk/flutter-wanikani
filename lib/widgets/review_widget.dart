import 'package:flutter/material.dart';

class ReviewWidget extends StatefulWidget {

  const ReviewWidget({
    super.key,
    required this.level,
  });

  final int level;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a level'), centerTitle: true),
      body: Container(color: const Color(0xFFFFE306))
    );
  }
}