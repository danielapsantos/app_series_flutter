import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeModel extends ChangeNotifier{
  bool isDark = false;
  MyTheme myTheme = MyTheme(color: Color(0xffffafcc));
  ThemeData get customTheme => myTheme.customTheme;
  ThemeData get customThemeDark => myTheme.customThemeDark;

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

class MyTheme {
  Color color;

  late ColorScheme colorScheme;
  late ColorScheme colorSchemeDark;
  late ThemeData customTheme;
  late ThemeData customThemeDark;

  MyTheme({required this.color}){
    colorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );

    colorSchemeDark = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );

    customTheme = ThemeData(
      colorScheme: colorScheme,
      textTheme: GoogleFonts.titilliumWebTextTheme(),
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

    customThemeDark = ThemeData(
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
   
  }
}