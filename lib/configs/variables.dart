import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/models/index.dart';

class VariablesConfig {
  static List<OnboardingPage> onboardingPages = [
    OnboardingPage(
      image: 'Onboarding.png',
      title: 'Welcome to iRD Connect!',
      description: 'Exploring our applications now!',
    ),
    OnboardingPage(
      image: 'Onboarding.png',
      title: 'Integrating AI into applications!',
      description: 'Exploring our AI applications now!',
    ),
    OnboardingPage(
      image: 'Onboarding.png',
      title: 'Free credits to your wallet!',
      description: 'Receive 300 free credits into your wallet immediately upon registration!',
    ),
  ];

  static List<MenuOption> menuOptions = [
    MenuOption(
      icon: Icons.wallet,
      title: 'My Wallet',
      page: RoutesConfig.wallet,
    ),
    MenuOption(
      icon: Icons.manage_accounts,
      title: 'Manage Account',
      page: RoutesConfig.account,
    ),
    MenuOption(
      icon: Icons.settings,
      title: 'Settings',
      page: RoutesConfig.settings,
    ),
    MenuOption(
      icon: Icons.logout,
      title: 'Logout',
      page: RoutesConfig.login,
    ),
  ];

  static List<FilterOption> filterOptions = [
    FilterOption(
      icon: Icons.apps,
      title: 'All',
    ),
    FilterOption(
      icon: Icons.article,
      title: 'Apps',
    ),
    FilterOption(
      icon: Icons.adb,
      title: 'AI Apps',
    ),
  ];

  static List<App> apps = [
    App(
      title: 'HPT AppScan',
      description: 'Scan vulnerability on your public application(s) and server(s).',
      image: 'AppScan.png',
    ),
    App(
      title: 'HPT BugTrack Platform',
      description: 'The platform tracks and manages project(s), project scope, and submits vulnerabilities you find.',
      image: 'BugTrack.png',
    ),
    App(
      title: 'HPT Mavex',
      description: 'Detect and analyze anomalies on your server(s).',
      image: 'Mavex.png',
    ),
    App(
      title: 'HPT MyBugTrack',
      description:
          'Tracking identified vulnerabilities and the vulnerability remediation process across your applications.',
      image: 'MyBugTrack.png',
    ),
    App(
      title: 'WebCheck',
      description: 'Comprehensive, on-demand open source intelligence for any website.',
      image: 'WebCheck.png',
    ),
  ];

  static List<App> aiApps = [
    App(
      title: 'HPT Malware Detection',
      description: 'Detect malicious code based on artificial intelligence technology.',
      image: 'MalwareDetection.png',
    ),
    App(
      title: 'HPT Malware Analysis',
      description: 'Analyze malicious code based on artificial intelligence signature.',
      image: 'MalwareAnalysis.png',
    ),
    App(
      title: 'HPT Web Vulnerability Detection',
      description: 'Detects common vulnerabilities in web applications based on artificial intelligence technology.',
      image: 'WebVulnerabilityDetection.png',
    ),
    App(
      title: 'HPT Software Vulnerability Detection',
      description: 'Detect vulnerabilities in application source code based on artificial intelligence technology.',
      image: 'SoftwareVulnerabilityDetection.png',
    ),
  ];
}
