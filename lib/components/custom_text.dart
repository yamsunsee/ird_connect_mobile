import 'package:flutter/material.dart';

enum ColorType { primary, secondary, paragraph, custom }

enum TextType { largeTitle, title, subtitle, description, custom }

class CustomText extends StatelessWidget {
  final String text;
  final bool isItalic;
  final bool isUpperCase;
  final ColorType color;
  final TextType type;
  final Color customColor;
  final double customSize;
  final FontWeight customWeight;

  const CustomText({
    super.key,
    required this.text,
    this.customSize = 16,
    this.isItalic = false,
    this.isUpperCase = false,
    this.color = ColorType.custom,
    this.type = TextType.custom,
    this.customColor = Colors.black,
    this.customWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    late double currentSize = customSize;
    late Color currentColor = customColor;
    late FontWeight currentWeight = customWeight;
    final themeColors = Theme.of(context);

    switch (color) {
      case ColorType.primary:
        currentColor = themeColors.colorScheme.primary;
        break;

      case ColorType.secondary:
        currentColor = themeColors.colorScheme.tertiary;
        break;

      case ColorType.paragraph:
        currentColor = themeColors.colorScheme.secondary;
        break;

      default:
        break;
    }

    switch (type) {
      case TextType.largeTitle:
        currentWeight = FontWeight.bold;
        currentSize = 32;
        break;

      case TextType.title:
        currentWeight = FontWeight.bold;
        currentSize = 28;
        break;

      case TextType.subtitle:
        currentSize = 20;
        break;

      case TextType.description:
        currentWeight = FontWeight.normal;
        currentSize = 12;
        break;

      default:
        break;
    }

    return Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        color: currentColor,
        fontSize: currentSize,
        fontWeight: currentWeight,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}
