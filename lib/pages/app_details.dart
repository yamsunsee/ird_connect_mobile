import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';

class AppDetails extends StatelessWidget {
  const AppDetails({super.key});

  Map<String, dynamic> _getProps(BuildContext context) {
    final ModalRoute<Object?> route = ModalRoute.of(context)!;
    final Map<String, dynamic> arguments =
        route.settings.arguments as Map<String, dynamic>;
    return arguments;
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item = _getProps(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(item['title']),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Image.asset(
              'assets/images/${item['image']}',
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              item['title'],
              style: StylesConfig.getTextStyle('h6'),
            ),
            Text(item['description'],
                style: StylesConfig.getTextStyleWithColor(
                    context, 'p', 'secondary')),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.developer_board),
              label: Text('Application is in development state'.toUpperCase()),
            ),
            const Divider(),
            Text('Introduction', style: StylesConfig.getTextStyle('h6')),
            Text(
                'We offer an exceptional service of conducting comprehensive vulnerability scans on your public applications and servers, ensuring that your digital infrastructure remains secure and protected. Our team of skilled cybersecurity experts utilizes cutting-edge scanning tools and methodologies to meticulously examine every aspect of your systems, leaving no stone unturned in the pursuit of identifying potential weaknesses and vulnerabilities.',
                style: StylesConfig.getTextStyleWithColor(
                    context, 'p', 'secondary')),
            const SizedBox(height: 16.0),
            Text('Features', style: StylesConfig.getTextStyle('h6')),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              leading: Icon(Icons.check_circle,
                  color: StylesConfig.getColor(context, 'primary')),
              horizontalTitleGap: -8.0,
              title: Text('Creating and managing project information',
                  style: StylesConfig.getTextStyleWithColor(
                      context, 'p', 'secondary')),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              leading: Icon(Icons.check_circle,
                  color: StylesConfig.getColor(context, 'primary')),
              horizontalTitleGap: -8.0,
              title: Text(
                  'Creating and managing information about project scopes',
                  style: StylesConfig.getTextStyleWithColor(
                      context, 'p', 'secondary')),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              leading: Icon(Icons.check_circle,
                  color: StylesConfig.getColor(context, 'primary')),
              horizontalTitleGap: -8.0,
              title: Text(
                  'Creating and managing information about vulnerabilities found in the project',
                  style: StylesConfig.getTextStyleWithColor(
                      context, 'p', 'secondary')),
            ),
            const SizedBox(height: 16.0),
            Text('Owner', style: StylesConfig.getTextStyle('h6')),
            Text('R&D - HPT Cyber Security',
                style: StylesConfig.getTextStyleWithColor(
                    context, 'p', 'secondary'))
          ],
        ));
  }
}
