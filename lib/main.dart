import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'iRD Connect',
          themeMode: theme.mode,
          theme: ThemesConfig.lightMode,
          darkTheme: ThemesConfig.darkMode,
          initialRoute: RoutesConfig.onboarding,
          routes: RoutesConfig.initial(context),
        ),
      ),
    );
  }
}
