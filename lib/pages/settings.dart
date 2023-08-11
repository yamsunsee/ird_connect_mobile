import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              horizontalTitleGap: -8.0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              trailing: Switch(
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                  value: isDarkMode),
            )
          ],
        ),
      ),
    );
  }
}
