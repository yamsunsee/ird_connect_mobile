import 'package:flutter/material.dart';

class StylesConfig {
  static final Map<String, List<dynamic>> defaultStyles = {
    'h1': [40.0, FontWeight.w700],
    'h2': [36.0, FontWeight.w600],
    'h3': [32.0, FontWeight.w500],
    'h4': [28.0, FontWeight.w400],
    'h5': [24.0, FontWeight.w400],
    'h6': [20.0, FontWeight.w400],
    'p': [16.0, FontWeight.w400],
  };

  static Color getColor(BuildContext context, String color) {
    final themeColors = Theme.of(context);

    switch (color) {
      case 'primary':
        return themeColors.colorScheme.primary;

      case 'secondary':
        return themeColors.colorScheme.secondary;

      case 'accent':
        return themeColors.colorScheme.tertiary;

      default:
        throw Exception('Invalid color: $color');
    }
  }

  static TextStyle getTextStyle(String type) {
    return TextStyle(
      fontSize: defaultStyles[type]![0],
      fontWeight: defaultStyles[type]![1],
    );
  }

  static TextStyle getTextStyleWithColor(BuildContext context, String type, String color) {
    return TextStyle(
      fontSize: defaultStyles[type]![0],
      fontWeight: defaultStyles[type]![1],
      color: getColor(context, color),
    );
  }
}
