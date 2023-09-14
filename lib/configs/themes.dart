import 'package:flutter/material.dart';

class ThemesConfig {
  static ThemeData lightMode = ThemeData(
    fontFamily: 'Oswald',
    brightness: Brightness.light,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.grey.shade600,
      tertiary: Colors.blue.shade300,
    ),
  );

  static ThemeData darkMode = ThemeData(
      fontFamily: 'Oswald',
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(foregroundColor: Colors.white)),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade400),
      ),
      colorScheme: ColorScheme.dark(
        primary: Colors.blue.shade400,
        secondary: Colors.grey.shade500,
        tertiary: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue.shade400,
      ));
}
