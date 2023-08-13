import 'package:flutter/material.dart';

class ThemesConfig {
  static ThemeData lightMode = ThemeData(
    fontFamily: 'Oswald',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey.shade200,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => Colors.indigo),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.indigo,
      secondary: Colors.grey.shade600,
    ),
  );

  static ThemeData darkMode = ThemeData(
    fontFamily: 'Oswald',
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.indigo.shade400,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(foregroundColor: Colors.white)),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => Colors.indigo),
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.indigo.shade400,
      secondary: Colors.grey.shade500,
    ),
  );
}
