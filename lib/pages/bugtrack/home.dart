import 'package:flutter/material.dart';
import 'package:ird_connect/configs/styles.dart';
import 'package:ird_connect/models/index.dart';
import 'package:ird_connect/pages/bugtrack/index.dart';

class BugTrackHome extends StatefulWidget {
  const BugTrackHome({super.key});

  @override
  State<BugTrackHome> createState() => _BugTrackHomeState();
}

class _BugTrackHomeState extends State<BugTrackHome> {
  late int _currentIndex = 0;
  final List<Navbar> _navbar = [
    Navbar(
      icon: Icons.dashboard,
      label: 'Dashboard',
      page: const Dashboard(),
    ),
    Navbar(
      icon: Icons.business_center,
      label: 'Projects',
      page: const Projects(),
    ),
    Navbar(
      icon: Icons.calendar_month,
      label: 'Calendar',
      page: const Calendar(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/BugTrack.png', height: 32),
            const SizedBox(width: 8),
            const Expanded(child: Text('HPT BugTrack Platform')),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _showDialog(context);
              },
              icon: const Icon(Icons.launch))
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _navbar.map((item) => item.page).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navbar
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.label,
                ))
            .toList(),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm action'.toUpperCase()),
          content: Text('Are you sure you want to redirect to HPT BugTrack Platform?',
              style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary')),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              label: const Text('No'),
              icon: const Icon(Icons.cancel_rounded),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              label: const Text('Yes'),
              icon: const Icon(Icons.check_circle),
            ),
          ],
        );
      },
    );
  }
}
