import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanikani/widgets/level_selector_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'WaniKani Kanji Review',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFF00AA),
          secondary: const Color(0xFF3CaBFF),
          background: const Color(0XFFe8e8e8),
          surface: const Color(0XFFf4f4f4)
        ),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.surface,
            statusBarBrightness: Brightness.light
          ),
          child: const LevelSelectorWidget()
        )
      ),
    );
  }
}