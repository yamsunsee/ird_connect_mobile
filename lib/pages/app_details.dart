import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/models/index.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:provider/provider.dart';

class AppDetails extends StatefulWidget {
  const AppDetails({super.key});

  @override
  State<AppDetails> createState() => _AppDetailsState();
}

class _AppDetailsState extends State<AppDetails> {
  App _getProps(BuildContext context) {
    final ModalRoute<Object?> route = ModalRoute.of(context)!;
    final App arguments = route.settings.arguments as App;
    return arguments;
  }

  @override
  Widget build(BuildContext context) {
    final App item = _getProps(context);

    return Consumer<UserProvider>(
      builder: (context, user, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(item.title),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Image.asset(
                'assets/images/${item.image}',
                height: 120,
              ),
              const SizedBox(height: 16),
              Text(
                item.title,
                style: StylesConfig.getTextStyle('h6'),
              ),
              Text(item.brief, style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary')),
              ElevatedButton.icon(
                onPressed: () {
                  user.isLoggedIn
                      ? (item.url.isNotEmpty ? Navigator.pushNamed(context, item.url) : Navigator.pop(context))
                      : Navigator.pushNamed(context, RoutesConfig.login);
                },
                icon: Icon(
                    user.isLoggedIn ? (item.url.isNotEmpty ? Icons.developer_board : Icons.construction) : Icons.login),
                label: Text(
                  user.isLoggedIn
                      ? (item.url.isNotEmpty
                          ? 'Launch application'.toUpperCase()
                          : 'Application is in development state'.toUpperCase())
                      : 'Login to launch application'.toUpperCase(),
                ),
              ),
              const Divider(),
              Text('Introduction', style: StylesConfig.getTextStyle('h6')),
              Text(item.description, style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary')),
              const SizedBox(height: 16),
              Text('Features', style: StylesConfig.getTextStyle('h6')),
              buildFeatures(context, item.features),
              const SizedBox(height: 16),
              Text(item.type == 'App' ? 'Production Team' : 'Research Team', style: StylesConfig.getTextStyle('h6')),
              buildTeam(context, item.team),
            ],
          ),
        );
      },
    );
  }

  Widget buildFeatures(BuildContext context, List<String> features) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features.map(
        (feature) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.stars,
                color: StylesConfig.getColor(context, 'primary'),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  feature,
                  style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary'),
                ),
              ),
            ],
          );
          // ListTile(
          //   contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          //   leading: Icon(Icons.check_circle, color: StylesConfig.getColor(context, 'primary')),
          //   horizontalTitleGap: -8,
          //   title: Text(
          //     feature,
          //     style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary'),
          //   ),
          // );
        },
      ).toList(),
    );
  }

  buildTeam(BuildContext context, Map<String, List<String>> team) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: team.entries.map((entry) {
        return Text(
          '${entry.key}: ${entry.value.join(', ')}',
          style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary'),
        );
      }).toList(),
    );
  }
}
