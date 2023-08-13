import 'package:flutter/material.dart';
import 'package:ird_connect/pages/index.dart';

class RoutesConfig {
  static const String home = '/';
  static const String wallet = '/wallet';
  static const String details = '/details';
  static const String settings = '/settings';
  static const String onboarding = '/onboarding';
  static const String account = '/manage_account';

  static Map<String, WidgetBuilder> initial(BuildContext context) {
    return {
      home: (context) => const Home(),
      wallet: (context) => const Wallet(),
      settings: (context) => const Settings(),
      details: (context) => const AppDetails(),
      onboarding: (context) => const Onboarding(),
      account: (context) => const ManageAccount(),
    };
  }
}
