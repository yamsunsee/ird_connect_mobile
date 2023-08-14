import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';

class ManageSecurity extends StatelessWidget {
  const ManageSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage Security'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text('How you sign in to iRD account?'.toUpperCase(),
                style: StylesConfig.getTextStyle('h6')),
            Text(
                'We recommend updating this information to make sure your iRD Account is accessible at all times.',
                style: StylesConfig.getTextStyleWithColor(
                    context, 'p', 'secondary')),
            const SizedBox(height: 8.0),
            ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text('Two Factor'),
              trailing: Switch(onChanged: (value) {}, value: false),
              horizontalTitleGap: -8.0,
              contentPadding: EdgeInsets.zero,
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Password'),
              trailing: const Icon(Icons.more_vert),
              horizontalTitleGap: -8.0,
              contentPadding: EdgeInsets.zero,
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('recoverymyemail@gmai.com'),
              subtitle: const Text('Recovery Email'),
              trailing: const Icon(Icons.more_vert),
              horizontalTitleGap: -8.0,
              contentPadding: EdgeInsets.zero,
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('0987654321'),
              subtitle: const Text('Recovery Phone'),
              trailing: const Icon(Icons.more_vert),
              horizontalTitleGap: -8.0,
              contentPadding: EdgeInsets.zero,
              onTap: () {},
            ),
          ],
        ));
  }
}
