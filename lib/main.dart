import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanikani/model/level_status.dart';
import 'package:flutter_wanikani/model/wanikani_colors.dart';
import 'package:flutter_wanikani/widgets/level_selector_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    const textColor = Color(0XFF333333);

    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'WaniKani Kanji Review',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0XFFfbfbfb),
            foregroundColor: textColor,
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: WaniKaniColors.pink.color,
            onPrimary: Colors.white,
            secondary: WaniKaniColors.blue.color,
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
        home: SafeArea(
          child: AnnotatedRegion(
            value: const SystemUiOverlayStyle(
              statusBarColor: Color(0XFFf4f4f4),
              statusBarBrightness: Brightness.light,
            ),
            child: LevelSelectorWidget()
          )
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  final _levelStatuses = {};

  void initialize() {
    SharedPreferences.getInstance().then((preferences) => _initializeLevels(preferences));
  }

  void _initializeLevels(SharedPreferences preferences) {
    for (var level = 1; level <= 60; level++) {
        var statusName = preferences.getString('level_status_$level');
        
        if (statusName == null) {
          continue;
        }

        LevelStatus status = LevelStatus.values.byName(statusName);
        _levelStatuses[level] = status;
      }

      notifyListeners();
  }

  LevelStatus getLevelStatus(int level) {
    return _levelStatuses[level] ?? LevelStatus.unseen;
  }

  void setLevelStatus(int level, LevelStatus status) {
    _levelStatuses[level] = status;

    SharedPreferences.getInstance()
      .then((preferences) => preferences.setString('level_status_$level', status.name));

    notifyListeners();
  }
}