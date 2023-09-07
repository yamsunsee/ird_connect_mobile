import 'package:flutter/material.dart';
import 'package:ird_connect/pages/index.dart';
import 'package:ird_connect/pages/bugtrack/index.dart';

class RoutesConfig {
  static const String home = '/';
  static const String login = '/login';
  static const String wallet = '/wallet';
  static const String details = '/details';
  static const String settings = '/settings';
  static const String register = '/register';
  static const String onboarding = '/onboarding';
  static const String account = '/manage_account';
  static const String security = '/manage_security';
  static const String information = '/manage_information';
  static const String bugtrack = '/bugtrack';

  static Map<String, WidgetBuilder> initial(BuildContext context) {
    return {
      home: (context) => const Home(),
      login: (context) => const Login(),
      wallet: (context) => const Wallet(),
      settings: (context) => const Settings(),
      register: (context) => const Register(),
      details: (context) => const AppDetails(),
      onboarding: (context) => const Onboarding(),
      account: (context) => const ManageAccount(),
      security: (context) => const ManageSecurity(),
      information: (context) => const ManageInformation(),
      bugtrack: (context) => const BugTrackHome(),
    };
  }
}
