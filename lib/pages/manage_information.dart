import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:provider/provider.dart';

class ManageInformation extends StatelessWidget {
  const ManageInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, user, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Manage Personal Information'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    _edit(context);
                  },
                  icon: const Icon(Icons.edit_note))
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text('Information', style: StylesConfig.getTextStyle('h6')),
              Text('Some information may be displayed in the applications within the iRD ecosystem.',
                  style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary')),
              const SizedBox(height: 8.0),
              ListTile(
                leading: const Icon(Icons.screenshot_monitor),
                title: Text(user.information.displayName),
                subtitle: const Text('Display Name'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8.0,
                contentPadding: EdgeInsets.zero,
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.perm_contact_cal),
                title: Text('${user.information.firstName} ${user.information.lastName}'),
                subtitle: const Text('Full Name'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8.0,
                contentPadding: EdgeInsets.zero,
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.boy),
                title: Text(user.information.gender),
                subtitle: const Text('Gender'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8.0,
                contentPadding: EdgeInsets.zero,
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month),
                title: Text(user.information.dateOfBirth),
                subtitle: const Text('Birthday'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8.0,
                contentPadding: EdgeInsets.zero,
                onTap: () {},
              ),
              const SizedBox(height: 16.0),
              Text('Contact', style: StylesConfig.getTextStyle('h6')),
              Text(
                  'You can manage your contact information so that our team can provide better support and assistance to you.',
                  style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary')),
              const SizedBox(height: 8.0),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(user.information.phoneNumber),
                subtitle: const Text('Phone Number'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8.0,
                contentPadding: EdgeInsets.zero,
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(user.information.email),
                subtitle: const Text('Email'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8.0,
                contentPadding: EdgeInsets.zero,
                onTap: () {},
              ),
              const SizedBox(height: 16.0),
              Text('Address', style: StylesConfig.getTextStyle('h6')),
              Text('Your home and office addresses are used to personalize your experience within our ecosystem.',
                  style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary')),
              const SizedBox(height: 8.0),
              ListTile(
                leading: const Icon(Icons.home),
                title: Text(user.information.address1),
                subtitle: const Text('Home'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8.0,
                contentPadding: EdgeInsets.zero,
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title: Text(user.information.address2),
                subtitle: const Text('Office'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8.0,
                contentPadding: EdgeInsets.zero,
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _edit(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Column(
          children: [Text('Edit information')],
        );
      },
    );
  }
}
