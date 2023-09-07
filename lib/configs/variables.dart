import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/models/index.dart';

class VariablesConfig {
  static List<OnboardingPage> onboardingPages = [
    OnboardingPage(
      image: 'Onboarding01.png',
      title: 'Welcome to \niRD Connect!',
      description: 'Exploring our applications now!',
    ),
    OnboardingPage(
      image: 'Onboarding02.png',
      title: 'Integrating AI \ninto applications!',
      description: 'Exploring our AI applications now!',
    ),
    OnboardingPage(
      image: 'Onboarding03.png',
      title: 'Free credits \nto your wallet!',
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

  static List<MenuOption> guestMenuOptions = [
    MenuOption(
      icon: Icons.settings,
      title: 'Settings',
      page: RoutesConfig.settings,
    ),
    MenuOption(
      icon: Icons.login,
      title: 'Login',
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
      type: 'App',
      brief: 'Scan vulnerability on your public application(s) and server(s).',
      image: 'AppScan.png',
      description:
          'We offer an exceptional service of conducting comprehensive vulnerability scans on your public applications and servers, ensuring that your digital infrastructure remains secure and protected. Our team of skilled cybersecurity experts utilizes cutting-edge scanning tools and methodologies to meticulously examine every aspect of your systems, leaving no stone unturned in the pursuit of identifying potential weaknesses and vulnerabilities.',
      features: [
        'Scanning with Nmap tool',
        'Scanning with Nikto tool',
        'Scanning with Nuclei tool',
        'Scanning with WordPress security scanner tool',
        'Scanning with OWASP Joomla Vulnerability Scanner tool',
        'Scanning the top 5 CVEs in 2022, 2023',
        'Scan history',
      ],
      team: {
        'Director': ['Nguyen Thanh Nam'],
        'Product Owner': ['Le Thanh Phuc'],
        'Team Leader': ['Le Thanh Phuc'],
        'Developer': [
          'Nguyen Dong Duy',
          'Nguyen Minh Trung',
          'Tran Dinh Danh',
          'Phan Dai Dang Khoa',
          'Nguyen Lien Khieu',
          'Ha Minh Thong'
        ],
        'Govern': ['R&D - HPT Cyber Security'],
      },
      url: '',
    ),
    App(
      title: 'HPT BugTrack Platform',
      type: 'App',
      brief: 'The platform tracks and manages project(s), project scope, and submits vulnerabilities you find.',
      image: 'BugTrack.png',
      description:
          'Our cutting-edge platform offers a robust suite of features designed to track and manage projects, define project scopes, and seamlessly submit vulnerabilities that are discovered. With our comprehensive solution, you can streamline your project management processes, ensure clear communication, and effectively address vulnerabilities to enhance the security of your projects.',
      features: [
        'Creating and managing project information',
        'Creating and managing information about project scopes',
        'Creating and managing information about vulnerabilities found in the project',
        'Tracking changes in vulnerabilities',
        'Discussing and exchanging directly about each vulnerability',
        'Using OWASP (Web, Mobile, API, ...) and NIST assessment standards',
        'Generating automated reports',
      ],
      team: {
        'Director': ['Nguyen Thanh Nam'],
        'Product Owner': ['Le Quoc Bao'],
        'Team Leader': ['Le Thanh Phuc'],
        'Developer': [
          'Le Thanh Phuc',
          'Lam Quoc Dat',
          'Nguyen Minh Trung',
          'Pham The Hien',
          'Nguyen Duy Tan',
          'Nguyen Huu Khanh'
        ],
        'Govern': ['R&D - HPT Cyber Security'],
      },
      url: RoutesConfig.bugtrack,
    ),
    App(
      title: 'HPT Mavex',
      type: 'App',
      brief: 'Detect and analyze anomalies on your server(s).',
      image: 'Mavex.png',
      description:
          'Our comprehensive solution enables you to detect and analyze anomalies on your server(s), providing enhanced security and proactive monitoring. With advanced algorithms and intelligent analytics, we help you identify and understand unusual behaviors or deviations from normal patterns, allowing you to take prompt action to mitigate potential risks.',
      features: [
        'Creating an automated agent for each review object',
        'Analyzing and reviewing malware based on the system\'s current state (including files on the system, processes, network connections, startup programs, scheduled tasks, memory, etc.)',
        'Analyzing and reviewing malware based on event logs and relevant security device logs',
        'Analyzing unusual indicators based on Sigma Rules, Yara Rules, signature-based, and IoCs',
        'Regularly updating rules through published IoCs',
        'Automatically analyzing the system\'s current state and optimizing analysis capabilities to minimize the risk to system performance',
        'Providing automatic data collection and sending to a centralized server for analysis',
        'Generating automated reports',
      ],
      team: {
        'Director': ['Nguyen Thanh Nam'],
        'Product Owner': ['Le Quoc Bao'],
        'Team Leader': ['Le Thanh Phuc'],
        'Developer': [
          'Nguyen Dong Duy',
          'Nguyen Van Tien Dung',
          'Nguyen Minh Trung',
        ],
        'Govern': ['R&D - HPT Cyber Security'],
      },
      url: '',
    ),
    App(
      title: 'HPT MyBugTrack',
      type: 'App',
      brief: 'Tracking identified vulnerabilities and the vulnerability remediation process across your applications.',
      image: 'MyBugTrack.png',
      description:
          'Our comprehensive solution offers robust capabilities for tracking identified vulnerabilities and managing the vulnerability remediation process across all your applications. With our platform, you can effectively monitor the status of vulnerabilities, prioritize remediation efforts, and ensure the security of your applications.',
      features: [
        'Managing project information',
        'Managing information about project scopes',
        'Managing information about vulnerabilities found in the project',
        'Tracking changes in vulnerabilities',
        'Engaging in direct discussions and exchanges regarding each vulnerability',
        'Generating automated reports',
      ],
      team: {
        'Director': ['Nguyen Thanh Nam'],
        'Product Owner': ['Le Quoc Bao'],
        'Team Leader': ['Le Thanh Phuc'],
        'Developer': [
          'Le Thanh Phuc',
          'Nguyen Minh Trung',
          'Tran Dinh Danh',
          'Phan Dai Dang Khoa',
        ],
        'Govern': ['R&D - HPT Cyber Security'],
      },
      url: '',
    ),
    // App(
    //   title: 'WebCheck',
    //   type: 'App',
    //   description: '',
    //   brief: 'Comprehensive, on-demand open source intelligence for any website.',
    //   image: 'WebCheck.png',
    //   features: [],
    //   team: {},
    // ),
  ];

  static List<App> aiApps = [
    App(
      title: 'HPT Malware Detection',
      type: 'AI App',
      brief: 'Detect malicious code based on artificial intelligence technology.',
      image: 'MalwareDetection.png',
      description:
          'Our application malware detection service offers advanced and comprehensive protection against malicious software threats. Using state-of-the-art technologies and intelligent algorithms, we proactively scan and analyze your applications to identify and mitigate any malware or suspicious behavior.',
      features: ['PE File'],
      team: {
        'Director': ['Nguyen Thanh Nam'],
        'Researcher': ['Huy Thai Thi', 'Le Thanh Phuc'],
        'Govern': ['R&D - HPT Cyber Security'],
      },
      url: '',
    ),
    App(
      title: 'HPT Malware Analysis',
      type: 'AI App',
      brief: 'Analyze malicious code based on artificial intelligence signature.',
      image: 'MalwareAnalysis.png',
      description:
          'Our cutting-edge service offers an advanced and powerful solution for analyzing malicious code using artificial intelligence (AI) signatures integrated into an IDA plugin. Our AI-powered IDA plugin leverages machine learning algorithms and deep learning models trained on vast datasets of known malware samples. This enables it to detect and analyze malicious code patterns, behaviors, and techniques with remarkable accuracy and speed.',
      features: ['Signature highlight'],
      team: {
        'Director': ['Nguyen Thanh Nam'],
        'Researcher': ['Huy Thai Thi', 'Le Thanh Phuc'],
        'Govern': ['R&D - HPT Cyber Security'],
      },
      url: '',
    ),
    App(
      title: 'HPT Web Vulnerability Detection',
      type: 'AI App',
      brief: 'Detects common vulnerabilities in web applications based on artificial intelligence technology.',
      image: 'WebVulnerabilityDetection.png',
      description:
          'Our advanced web application security solution utilizes state-of-the-art artificial intelligence (AI) technology to detect common vulnerabilities in web applications. By leveraging AI algorithms and machine learning models, we provide comprehensive and accurate vulnerability detection, helping you identify and address security risks in your web applications.',
      features: ['SQL Injection', 'Cross-site scripting', 'Command Injection'],
      team: {
        'Director': ['Nguyen Thanh Nam'],
        'Researcher': ['Le Duc Minh', 'Le Thanh Phuc'],
        'Govern': ['R&D - HPT Cyber Security'],
      },
      url: '',
    ),
    // App(
    //   title: 'HPT Software Vulnerability Detection',
    //   type: 'AI App',
    //   description: '',
    //   brief: 'Detect vulnerabilities in application source code based on artificial intelligence technology.',
    //   image: 'SoftwareVulnerabilityDetection.png',
    //   features: [],
    //   team: {},
    // ),
  ];
}
