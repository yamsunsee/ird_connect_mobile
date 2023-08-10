import 'package:flutter/material.dart';
import 'package:ird_connect/pages/index.dart';

const List<Map<String, dynamic>> onboardingPages = [
  {
    'image': 'Onboarding.png',
    'title': 'Welcome to iRD Connect!',
    'descriptions': 'Exploring our applications now!'
  },
  {
    'image': 'Onboarding.png',
    'title': 'Integrating AI into applications!',
    'descriptions': 'Exploring our AI applications now!'
  },
  {
    'image': 'Onboarding.png',
    'title': 'Free credits to your wallet!',
    'descriptions':
        'Receive 300 free credits into your wallet immediately upon registration!'
  },
];

const List<Map<String, dynamic>> menuOptions = [
  {
    'icon': Icons.wallet,
    'title': 'My Wallet',
    'page': Wallet(),
  },
  {
    'icon': Icons.manage_accounts,
    'title': 'Manage Account',
    'page': ManageAccount(),
  },
  {
    'icon': Icons.settings,
    'title': 'Settings',
    'page': Settings(),
  },
  {
    'icon': Icons.logout,
    'title': 'Logout',
    'page': null,
  },
];

const List<Map<String, dynamic>> filterOptions = [
  {
    'icon': Icons.apps,
    'title': 'All',
  },
  {
    'icon': Icons.article,
    'title': 'Apps',
  },
  {
    'icon': Icons.adb,
    'title': 'AI Apps',
  },
];

const List<Map<String, dynamic>> apps = [
  {
    'title': 'HPT AppScan',
    'description':
        'Scan vulnerability on your public application(s) and server(s).',
    'image': 'AppScan.png',
  },
  {
    'title': 'HPT BugTrack Platform',
    'description':
        'The platform tracks and manages project(s), project scope, and submits vulnerabilities you find.',
    'image': 'BugTrack.png',
  },
  {
    'title': 'HPT Mavex',
    'description': 'Detect and analyze anomalies on your server(s).',
    'image': 'Mavex.png',
  },
  {
    'title': 'HPT MyBugTrack',
    'description':
        'Tracking identified vulnerabilities and the vulnerability remediation process across your applications.',
    'image': 'MyBugTrack.png',
  },
  {
    'title': 'WebCheck',
    'description':
        'Comprehensive, on-demand open source intelligence for any website.',
    'image': 'WebCheck.png',
  },
];

const List<Map<String, dynamic>> aiApps = [
  {
    'title': 'HPT Malware Detection',
    'description':
        'Detect malicious code based on artificial intelligence technology.',
    'image': 'MalwareDetection.png',
  },
  {
    'title': 'HPT Malware Analysis',
    'description':
        'Analyze malicious code based on artificial intelligence signature.',
    'image': 'MalwareAnalysis.png',
  },
  {
    'title': 'HPT Web Vulnerability Detection',
    'description':
        'Detects common vulnerabilities in web applications based on artificial intelligence technology.',
    'image': 'WebVulnerabilityDetection.png',
  },
  {
    'title': 'HPT Software Vulnerability Detection',
    'description':
        'Detect vulnerabilities in application source code based on artificial intelligence technology.',
    'image': 'SoftwareVulnerabilityDetection.png',
  },
];
