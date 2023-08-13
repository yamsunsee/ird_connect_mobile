import 'package:flutter/material.dart';

class ThemesConfig {
  static ThemeData lightMode = ThemeData(
    fontFamily: 'Oswald',
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    primaryColor: Colors.indigo,
    colorScheme: const ColorScheme.light(
      background: Colors.indigo,
    ),
  );
  static ThemeData darkMode = ThemeData(
    fontFamily: 'Oswald',
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    primaryColor: Colors.indigo,
    colorScheme: const ColorScheme.dark(
      background: Colors.indigo,
      onBackground: Colors.white,
    ),
  );
}
