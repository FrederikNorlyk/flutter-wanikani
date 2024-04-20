import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanikani/data/kanji_store.dart';
import 'package:flutter_wanikani/model/kanji_item.dart';
import 'package:flutter_wanikani/model/level.dart';
import 'package:flutter_wanikani/enum/status.dart';
import 'package:flutter_wanikani/enum/wanikani_colors.dart';
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
      create: (context) => _createState(context),
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
        home: const SafeArea(
          child: AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: Color(0XFFf4f4f4),
              statusBarBrightness: Brightness.light,
            ),
            child: LevelSelectorWidget()
          )
        ),
      ),
    );
  }

  MyAppState _createState(BuildContext context) {
    var state = MyAppState();
    state.initialize();
    return state;
  }
}

class MyAppState extends ChangeNotifier {
  final List<Level> _levels = [];

  void initialize() {
    SharedPreferences.getInstance().then((preferences) => _initialize(preferences));
  }

  Future<void> _initialize(SharedPreferences preferences) async {
    for (var level = 1; level <= 60; level++) {
      var items = await KanjiStore.getItemsFor(level);
      
      for (var item in items) {
        var statusName = preferences.getString('kanji_status_${item.kanji}');
        
        if (statusName == null) {
          continue;
        }
        
        item.status = Status.values.byName(statusName);
      }

      _levels.add(Level(level, items));
    }

    notifyListeners();
  }

  List<KanjiItem> getItems(int levelNumber) {
    var level = _levels.firstWhere((level) => level.level == levelNumber);
    // Dereference the list
    return [...level.kanjiItems];
  }

  Status getLevelStatus(int levelNumber) {
    if (_levels.isEmpty) {
      return Status.unseen;
    }
    
    var level = _levels.firstWhere((level) => level.level == levelNumber);
    return level.status;
  }

  void setKanjiStatus(int levelNumber, KanjiItem item, Status status) {
    var level = _levels.firstWhere((level) => level.level == levelNumber);
    level.setKanjiItemStatus(item, status);

    SharedPreferences.getInstance()
      .then((preferences) => preferences.setString('kanji_status_${item.kanji}', status.name));

    notifyListeners();
  }

  void resetState() {
    SharedPreferences.getInstance().then((preferences) => _clearState(preferences));
  }

  void _clearState(SharedPreferences preferences) {
    preferences.clear();
    _levels.clear();
    _initialize(preferences);
    notifyListeners();
  }
}