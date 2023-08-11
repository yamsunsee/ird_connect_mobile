import 'package:flutter/material.dart';
import 'package:ird_connect/utils/index.dart';

class AppDetails extends StatelessWidget {
  const AppDetails({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text(item['title']),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/${item['image']}',
                height: 200,
              ),
              const SizedBox(height: 16),
              Text(
                item['title'],
                style: Styles.h4p,
              ),
              Text(item['description'], style: Styles.p),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.developer_board),
                label:
                    Text('Application is in development state'.toUpperCase()),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: const [
                    Text('Introduction', style: Styles.h5),
                    Text(
                        'We offer an exceptional service of conducting comprehensive vulnerability scans on your public applications and servers, ensuring that your digital infrastructure remains secure and protected. Our team of skilled cybersecurity experts utilizes cutting-edge scanning tools and methodologies to meticulously examine every aspect of your systems, leaving no stone unturned in the pursuit of identifying potential weaknesses and vulnerabilities.',
                        style: Styles.p),
                    SizedBox(height: 16.0),
                    Text('Features', style: Styles.h5),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      leading: Icon(Icons.check_circle, color: Colors.indigo),
                      horizontalTitleGap: -8.0,
                      title: Text('Creating and managing project information',
                          style: Styles.p),
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      leading: Icon(Icons.check_circle, color: Colors.indigo),
                      horizontalTitleGap: -8.0,
                      title: Text(
                          'Creating and managing information about project scopes',
                          style: Styles.p),
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      leading: Icon(Icons.check_circle, color: Colors.indigo),
                      horizontalTitleGap: -8.0,
                      title: Text(
                          'Creating and managing information about vulnerabilities found in the project',
                          style: Styles.p),
                    ),
                    SizedBox(height: 16.0),
                    Text('Owner', style: Styles.h5),
                    Text('R&D - HPT Cyber Security', style: Styles.p),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
