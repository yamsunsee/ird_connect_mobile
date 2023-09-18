import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;

  const CustomIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Colors.lightBlueAccent,
            Colors.blueAccent,
          ],
        ).createShader(bounds);
      },
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
