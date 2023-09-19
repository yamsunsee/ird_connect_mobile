import 'package:flutter/material.dart';
import 'package:ird_connect/components/custom_text.dart';

enum SizeType { normal, large }

class CustomButton extends StatelessWidget {
  final String text;
  final SizeType size;
  final double spacing;
  final bool isWidthFit;
  final Function onPressed;
  final double? width;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  const CustomButton({
    super.key,
    this.width,
    this.suffixIcon,
    this.prefixIcon,
    this.spacing = 4,
    this.size = SizeType.normal,
    this.isWidthFit = false,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        padding: EdgeInsets.all(size == SizeType.large ? 12 : 8),
        child: Row(
          mainAxisSize: isWidthFit ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: prefixIcon.runtimeType == IconData,
              child: Row(
                children: [
                  Icon(
                    prefixIcon,
                    color: Colors.white,
                  ),
                  SizedBox(width: spacing),
                ],
              ),
            ),
            CustomText(
              text: text,
              customColor: Colors.white,
              type: size == SizeType.large ? TextType.subtitle : TextType.custom,
              customWeight: FontWeight.w500,
              isUpperCase: true,
            ),
            Visibility(
              visible: suffixIcon.runtimeType == IconData,
              child: Row(
                children: [
                  SizedBox(width: spacing),
                  Icon(
                    suffixIcon,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
