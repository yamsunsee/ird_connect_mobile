import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/providers/index.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = PostHttpOverrides();
  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  await Hive.openBox('iRD');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isVisited = true;
  final _localStorage = Hive.box('iRD');

  @override
  void initState() {
    _isVisited = _localStorage.get('isVisited') ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => BugTrackProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'iRD Connect',
          themeMode: theme.mode,
          theme: ThemesConfig.lightMode,
          darkTheme: ThemesConfig.darkMode,
          initialRoute: _isVisited ? RoutesConfig.home : RoutesConfig.onboarding,
          routes: RoutesConfig.initial(context),
        ),
      ),
    );
  }
}
