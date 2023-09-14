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
            leading: Container(
              margin: const EdgeInsets.only(left: 16),
              child: Image.asset('assets/images/Logo.png'),
            ),
            leadingWidth: 48,
            title: const Text('iRD Connect'),
            actions: [buildMenuOptions(context, user.isLoggedIn)],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: user.isLoggedIn,
                        child: CustomText(
                          text: 'Welcome, ${user.information.displayName}!',
                          type: TextType.subtitle,
                          color: ColorType.primary,
                          isUpperCase: true,
                        ),
                      ),
                      const CustomText(
                        text: 'Connecting Strategies',
                        type: TextType.largeTitle,
                        color: ColorType.primary,
                        isUpperCase: true,
                      ),
                      const CustomText(
                        text: 'Fortifying Defenses',
                        type: TextType.largeTitle,
                        color: ColorType.primary,
                        isUpperCase: true,
                      ),
                      const CustomText(
                        text: 'Your Cybersecurity Partner',
                        type: TextType.subtitle,
                        color: ColorType.paragraph,
                        isUpperCase: true,
                      ),
                      Visibility(
                        visible: !user.isLoggedIn,
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, RoutesConfig.register);
                          },
                          icon: ShaderMask(
                            shaderCallback: (bounds) {
                              return const LinearGradient(
                                colors: [
                                  Colors.lightBlueAccent,
                                  Colors.blueAccent,
                                ],
                              ).createShader(bounds);
                            },
                            child: const Icon(Icons.add_moderator, color: Colors.white),
                          ),
                          label: const CustomText(
                            text: 'Get started for free',
                            type: TextType.description,
                            color: ColorType.primary,
                          ),
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
