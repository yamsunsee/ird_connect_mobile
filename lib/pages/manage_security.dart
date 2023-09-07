import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:provider/provider.dart';

class ManageSecurity extends StatelessWidget {
  const ManageSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, user, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Manage Security'),
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('How you sign in to iRD account?', style: StylesConfig.getTextStyle('h6')),
                Text('We recommend updating this information to make sure your iRD Account is accessible at all times.',
                    style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary')),
                const SizedBox(height: 8),
                ListTile(
                  leading: const Icon(Icons.verified_user),
                  title: const Text('Two Factor'),
                  trailing: Switch(onChanged: (value) {}, value: user.information.twoFactorEnabled),
                  horizontalTitleGap: -8,
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: Text(user.information.passwordLastChanged.isNotEmpty
                      ? user.information.passwordLastChanged
                      : 'Unchanged'),
                  subtitle: const Text('Password'),
                  trailing: const Icon(Icons.more_vert),
                  horizontalTitleGap: -8,
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(user.information.recoveryEmail.isNotEmpty ? user.information.recoveryEmail : 'Unset'),
                  subtitle: const Text('Recovery Email'),
                  trailing: const Icon(Icons.more_vert),
                  horizontalTitleGap: -8,
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text(
                      user.information.recoveryPhoneNumber.isNotEmpty ? user.information.recoveryPhoneNumber : 'Unset'),
                  subtitle: const Text('Recovery Phone'),
                  trailing: const Icon(Icons.more_vert),
                  horizontalTitleGap: -8,
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                ),
              ],
            ));
      },
    );
  }
}
