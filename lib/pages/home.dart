import 'package:flutter/material.dart';
import 'package:ird_connect/components/index.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/models/index.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:ird_connect/services/index.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedOption = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final isLoggedIn = Provider.of<UserProvider>(context, listen: false).isLoggedIn;
      if (isLoggedIn) UserService.getInformation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, user, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Wrap(
              spacing: 8,
              children: [Image.asset('assets/images/Logo.png', height: 32), const Text('iRD Connect')],
            ),
            actions: [buildMenuOptions(context, user.isLoggedIn)],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (user.isLoggedIn)
                        Text('Welcome, ${user.information.displayName}!'.toUpperCase(),
                            style: StylesConfig.getTextStyleWithColor(context, 'h4', 'accent')),
                      Text('Connecting Strategies'.toUpperCase(),
                          style: StylesConfig.getTextStyleWithColor(context, 'h3', 'primary')),
                      Text('Fortifying Defenses'.toUpperCase(),
                          style: StylesConfig.getTextStyleWithColor(context, 'h3', 'primary')),
                      Text('Your Cybersecurity Partner'.toUpperCase(),
                          style: StylesConfig.getTextStyleWithColor(context, 'h6', 'secondary')),
                      Visibility(
                        visible: !user.isLoggedIn,
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, RoutesConfig.register);
                          },
                          icon: const Icon(Icons.add_moderator),
                          label: const Text('Get started for free'),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/images/Onboarding.png', height: 120),
                buildFilterOptions(context),
                buildAppCards(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildMenuOptions(BuildContext context, bool isLoggedIn) {
    final options = isLoggedIn ? VariablesConfig.menuOptions : VariablesConfig.guestMenuOptions;
    return PopupMenuButton(
      icon: const Icon(Icons.menu),
      itemBuilder: (context) => options
          .map(
            (option) => PopupMenuItem(
              child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, option.page);
                    if (option.page == '/login') {
                      UserService.logout(context);
                    }
                  },
                  leading: Icon(option.icon),
                  title: Text(option.title),
                  horizontalTitleGap: -8),
            ),
          )
          .toList(),
    );
  }

  Widget buildFilterOptions(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: VariablesConfig.filterOptions.asMap().entries.map((entry) {
        int index = entry.key;
        FilterOption option = entry.value;
        int count = index == 1
            ? VariablesConfig.apps.length
            : index == 2
                ? VariablesConfig.aiApps.length
                : VariablesConfig.apps.length + VariablesConfig.aiApps.length;

        return ActionChip(
          label: Text(
            '${option.title} ($count)',
            style: TextStyle(
              color: selectedOption == index ? Colors.white : StylesConfig.getColor(context, 'primary'),
              fontSize: 12,
            ),
          ),
          avatar: Icon(
            option.icon,
            size: 16,
            color: selectedOption == index ? Colors.white : StylesConfig.getColor(context, 'primary'),
          ),
          backgroundColor: selectedOption == index
              ? StylesConfig.getColor(context, 'primary')
              : StylesConfig.getColor(context, 'primary').withAlpha(50),
          onPressed: () {
            setState(() {
              selectedOption = index;
            });
          },
          padding: const EdgeInsets.all(8),
        );
      }).toList(),
    );
  }

  Widget buildAppCards() {
    List<App> cards = selectedOption == 1
        ? VariablesConfig.apps
        : selectedOption == 2
            ? VariablesConfig.aiApps
            : [...VariablesConfig.apps, ...VariablesConfig.aiApps];

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      children: cards.map((app) => AppCard(item: app)).toList(),
    );
  }
}
