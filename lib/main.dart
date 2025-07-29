import 'package:app_series_flutter/tv_show_form_screen.dart';
import 'package:app_series_flutter/custom_drawer.dart';
import 'package:app_series_flutter/my_theme_model.dart';
import 'package:app_series_flutter/tv_show_model.dart';
import 'package:app_series_flutter/tv_show_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => TvShowModel(),
    //   child: const MainApp()
    // )
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context) => TvShowModel()
        ),
        ChangeNotifierProvider(
          create: (context) => MyThemeModel()
        ),
      ],
        child:  const MainApp()
    )
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //screen control
  int currentScreenIndex = 0;

  List<Widget> get screens => [
    TvShowScreen(),
    TvShowFormScreen(
      switchScreen: switchScreen
    ),
  ];

  void switchScreen(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.read<MyThemeModel>().customTheme,
      darkTheme: context.read<MyThemeModel>().customThemeDark,
      themeMode: context.watch<MyThemeModel>().isDark
        ? ThemeMode.dark
        : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: const Text('I Love Series 🎬')),
        drawer: CustomDrawer(
          switchScreen: switchScreen,
        ),
        body: screens[currentScreenIndex],
      ),
    );
  }
}
