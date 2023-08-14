import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Personal Information'),
              trailing: const Icon(Icons.more_vert),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: -8.0,
              onTap: () {
                Navigator.pushNamed(context, RoutesConfig.information);
              },
            ),
            ListTile(
                leading: const Icon(Icons.security),
                title: const Text('Security'),
                trailing: const Icon(Icons.more_vert),
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: -8.0,
                onTap: () {
                  Navigator.pushNamed(context, RoutesConfig.security);
                }),
          ],
        ),
      ),
    );
  }
}
