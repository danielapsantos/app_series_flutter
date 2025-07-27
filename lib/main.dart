import 'package:app_series_flutter/add_tv_show_screen.dart';
import 'package:app_series_flutter/custom_drawer.dart';
import 'package:app_series_flutter/tv_show_data.dart';
import 'package:app_series_flutter/tv_show_model.dart';
import 'package:app_series_flutter/tv_show_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<TvShow> tvShows = favTvShowList;

  void addTvShow(TvShow tvShow) {
    setState(() {
      tvShows.add(tvShow);
    });
  }

  void removeTvShow(TvShow tvShow) {
    // final index = tvShows.indexWhere(
    //   (show) => show.title.toLowerCase() == tvShow.title.toLowerCase(),
    // );
    setState(() {
      // tvShows.removeAt(index); // remoção por uma atributo especifico
      tvShows.remove(tvShow);
    });
  }

  //screen control
  int currentScreenIndex = 0;

  List<Widget> get screens => [
    TvShowScreen(
      tvShows: tvShows,
      removeTvShow: removeTvShow
    ),
    AddTvShowScreen(
      addTvShow: addTvShow,
      switchScreen: switchScreen
    ),
  ];

  void switchScreen(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  //theme control
  bool isDark = false;
  void switchTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    var color = Color(0xffffafcc);
    var colorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );

    var colorSchemeDark = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );

    var customTheme = ThemeData(
      colorScheme: colorScheme,
      fontFamily: GoogleFonts.titilliumWeb().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: colorScheme.primary,
        titleTextStyle: GoogleFonts.shadowsIntoLight(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.primaryContainer,
        shadowColor: colorScheme.onSurface,
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );

    var customThemeDark = ThemeData(
      colorScheme: colorSchemeDark,
      fontFamily: GoogleFonts.titilliumWeb().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: colorSchemeDark.onPrimary,
        titleTextStyle: GoogleFonts.shadowsIntoLight(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorSchemeDark.primary,
        ),
        iconTheme: IconThemeData(color: colorSchemeDark.primary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorSchemeDark.primaryContainer,
        shadowColor: colorSchemeDark.onSurface,
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      darkTheme: customThemeDark,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: const Text('I Love Series 🎬')),
        drawer: CustomDrawer(
          isDark: isDark,
          switchTheme: switchTheme,
          switchScreen: switchScreen,
        ),
        body: screens[currentScreenIndex],
      ),
    );
  }
}
