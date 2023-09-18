import 'package:flutter/material.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ListTile(
                onTap: theme.toggleMode,
                horizontalTitleGap: -8,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  onChanged: theme.setMode,
                  value: theme.isDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
