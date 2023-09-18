import 'package:flutter/material.dart';

enum ColorType { gradient, primary, secondary, paragraph, custom }

enum TextType { extraLargeTitle, largeTitle, title, subtitle, description, custom }

class CustomText extends StatelessWidget {
  final String text;
  final bool isItalic;
  final bool isUpperCase;
  final TextAlign align;
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
    this.align = TextAlign.start,
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
        currentColor = themeColors.colorScheme.secondary;
        break;

      case ColorType.paragraph:
        currentColor = Colors.grey;
        break;

      default:
        break;
    }

    switch (type) {
      case TextType.extraLargeTitle:
        currentWeight = FontWeight.bold;
        currentSize = 32;
        break;

      case TextType.largeTitle:
        currentWeight = FontWeight.bold;
        currentSize = 28;
        break;

      case TextType.title:
        currentWeight = FontWeight.w600;
        currentSize = 24;
        break;

      case TextType.subtitle:
        currentWeight = FontWeight.w500;
        currentSize = 20;
        break;

      case TextType.description:
        currentWeight = FontWeight.normal;
        currentSize = 12;
        break;

      default:
        break;
    }

    if (color == ColorType.gradient) {
      return ShaderMask(
        shaderCallback: (bounds) {
          return const LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
            ],
          ).createShader(bounds);
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: currentSize,
            fontWeight: currentWeight,
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
          ),
          textAlign: align,
        ),
      );
    } else {
      return Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          color: currentColor,
          fontSize: currentSize,
          fontWeight: currentWeight,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        ),
        textAlign: align,
      );
    }
  }
}
