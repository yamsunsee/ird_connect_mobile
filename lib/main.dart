import 'package:flutter/material.dart';
import 'package:ird_connect/pages/index.dart';

void main() {
  runApp(const MyApp());
}

bool isDark = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iRD Connect',
      theme: ThemeData(brightness: Brightness.light),
      home: const Onboarding(),
    );
  }
}
