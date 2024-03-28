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

    const textColor = Color(0XFF333333);

    return MaterialApp(
      title: 'WaniKani Kanji Review',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFFfbfbfb),
          foregroundColor: textColor,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFF00AA),
          onPrimary: Colors.white,
          secondary: const Color(0xFF3CaBFF),
          onSecondary: Colors.white,
          background: const Color(0XFFe8e8e8),
          onBackground: textColor,
          surface: const Color(0XFFf4f4f4)
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: textColor),
          bodyMedium: TextStyle(color: textColor),
          bodySmall: TextStyle(color: textColor),
        ),
        fontFamily: 'NotoSans',
        fontFamilyFallback: const ['NotoSansJP'],
        useMaterial3: true,
      ),
      home: const SafeArea(
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Color(0XFFf4f4f4),
            statusBarBrightness: Brightness.light,
          ),
          child: LevelSelectorWidget()
        )
      ),
    );
  }
}