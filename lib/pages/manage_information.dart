import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';

class ManageInformation extends StatelessWidget {
  const ManageInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Personal Information'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text('Information', style: StylesConfig.getTextStyle('h6')),
          Text(
              'Some information may be displayed in the applications within the iRD ecosystem.',
              style: StylesConfig.getTextStyleWithColor(
                  context, 'p', 'secondary')),
          const SizedBox(height: 8.0),
          ListTile(
            leading: const Icon(Icons.screenshot_monitor),
            title: const Text('HienPT'),
            subtitle: const Text('Display Name'),
            trailing: const Icon(Icons.more_vert),
            horizontalTitleGap: -8.0,
            contentPadding: EdgeInsets.zero,
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.perm_contact_cal),
            title: const Text('Pham The Hien'),
            subtitle: const Text('Full Name'),
            trailing: const Icon(Icons.more_vert),
            horizontalTitleGap: -8.0,
            contentPadding: EdgeInsets.zero,
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.boy),
            title: const Text('Male'),
            subtitle: const Text('Gender'),
            trailing: const Icon(Icons.more_vert),
            horizontalTitleGap: -8.0,
            contentPadding: EdgeInsets.zero,
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('01-01-2002'),
            subtitle: const Text('Birthday'),
            trailing: const Icon(Icons.more_vert),
            horizontalTitleGap: -8.0,
            contentPadding: EdgeInsets.zero,
            onTap: () {},
          ),
          const SizedBox(height: 16.0),
          Text('Contact', style: StylesConfig.getTextStyle('h6')),
          Text(
              'You can manage your contact information so that our team can provide better support and assistance to you.',
              style: StylesConfig.getTextStyleWithColor(
                  context, 'p', 'secondary')),
          const SizedBox(height: 8.0),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('0123456789'),
            subtitle: const Text('Phone Number'),
            trailing: const Icon(Icons.more_vert),
            horizontalTitleGap: -8.0,
            contentPadding: EdgeInsets.zero,
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('chubengocnghech@gmail.com'),
            subtitle: const Text('Gmail'),
            trailing: const Icon(Icons.more_vert),
            horizontalTitleGap: -8.0,
            contentPadding: EdgeInsets.zero,
            onTap: () {},
          ),
          const SizedBox(height: 16.0),
          Text('Address', style: StylesConfig.getTextStyle('h6')),
          Text(
              'Your home and office addresses are used to personalize your experience within our ecosystem.',
              style: StylesConfig.getTextStyleWithColor(
                  context, 'p', 'secondary')),
          const SizedBox(height: 8.0),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Ben Tre Province'),
            subtitle: const Text('Home'),
            trailing: const Icon(Icons.more_vert),
            horizontalTitleGap: -8.0,
            contentPadding: EdgeInsets.zero,
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text('HPT Vietnam Corporation'),
            subtitle: const Text('Office'),
            trailing: const Icon(Icons.more_vert),
            horizontalTitleGap: -8.0,
            contentPadding: EdgeInsets.zero,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
