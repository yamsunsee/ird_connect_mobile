import 'package:flutter/material.dart';

class ThemesConfig {
  static ThemeData lightMode = ThemeData(
    fontFamily: 'Rubik',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.grey.shade400,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'Rubik',
      ),
      iconTheme: IconThemeData(color: Colors.grey.shade400),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.black.withOpacity(0.8),
      tertiary: Colors.blue.shade50,
    ),
  );

  static ThemeData darkMode = ThemeData(
      fontFamily: 'Rubik',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black87,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'Rubik',
        ),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade400),
      ),
      colorScheme: ColorScheme.dark(
        primary: Colors.blue.shade400,
        secondary: Colors.white.withOpacity(0.8),
        tertiary: Colors.grey.shade900,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue.shade400,
      ));
}
