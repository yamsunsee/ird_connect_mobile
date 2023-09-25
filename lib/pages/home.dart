import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ird_connect/models/index.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/services/index.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:ird_connect/components/index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _localStorage = Hive.box('iRD');
  late bool _isVisited = false;
  late int _count = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    Future.delayed(Duration.zero, () {
      final isLoggedIn = Provider.of<UserProvider>(context, listen: false).isLoggedIn;
      if (isLoggedIn) UserService.getInformation(context);
    });

    _isVisited = _localStorage.get('isVisited') ?? false;
    if (!_isVisited) _localStorage.put('isVisited', true);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildBanner(user),
                const SizedBox(height: 8),
                buildTabBar(context),
                const SizedBox(height: 8),
                buildTabBarView(context),
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
      itemBuilder: (context) {
        return options
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
                  horizontalTitleGap: -8,
                ),
              ),
            )
            .toList();
      },
    );
  }

  Widget buildAppCards({String type = 'all'}) {
    late List<App> cards;

    switch (type) {
      case 'apps':
        cards = VariablesConfig.apps;
        break;

      case 'aiApps':
        cards = VariablesConfig.aiApps;
        break;

      default:
        cards = [...VariablesConfig.apps, ...VariablesConfig.aiApps];
        break;
    }

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(4),
      physics: const NeverScrollableScrollPhysics(),
      children: cards.map((app) => AppCard(item: app)).toList(),
    );
  }

  Widget buildBanner(UserProvider user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: user.isLoggedIn,
          replacement: TextButton.icon(
            onPressed: () {
              _isVisited
                  ? Navigator.pushNamed(context, RoutesConfig.login)
                  : Navigator.pushNamed(context, RoutesConfig.register);
            },
            icon: CustomIcon(
              icon: _isVisited ? Icons.policy : Icons.add_moderator,
            ),
            label: CustomText(
              text: _isVisited ? 'Login to explore now!' : 'Get started for free!',
              color: ColorType.gradient,
              isItalic: true,
            ),
          ),
          child: TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, RoutesConfig.information);
            },
            icon: const CustomIcon(icon: Icons.ads_click_rounded),
            label: CustomText(
              text: 'Welcome${_isVisited ? ' back' : ''}, ${user.information.displayName}!',
              color: ColorType.gradient,
              isItalic: true,
            ),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Connecting \nStrategies,',
                    type: TextType.title,
                    color: ColorType.gradient,
                    isUpperCase: true,
                  ),
                  const CustomText(
                    text: 'Fortifying Defenses',
                    type: TextType.title,
                    color: ColorType.gradient,
                    isUpperCase: true,
                  ),
                  CustomText(
                    text: 'Your Cybersecurity Partner',
                    customColor: Colors.purple.shade300,
                    isUpperCase: true,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -32,
              right: 16,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_count < 6) {
                      _count++;
                    } else {
                      _count = 0;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).colorScheme.tertiary,
                          content: const CustomText(
                            text: 'Are you sure to clear local storage?',
                            color: ColorType.paragraph,
                            type: TextType.description,
                          ),
                          duration: const Duration(seconds: 3),
                          action: SnackBarAction(
                            textColor: Theme.of(context).colorScheme.primary,
                            label: 'Clear',
                            onPressed: () {
                              _localStorage.delete('isVisited');
                            },
                          ),
                        ),
                      );
                    }
                  });
                },
                child: Image.asset('assets/images/Onboarding.png', height: 100),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTabBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        labelPadding: const EdgeInsets.all(8),
        labelColor: Colors.white,
        unselectedLabelColor: Theme.of(context).colorScheme.primary,
        tabs: VariablesConfig.filterOptions.map((item) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 16),
              const SizedBox(width: 4),
              Text(item.title),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget buildTabBarView(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight - 300,
      child: TabBarView(
        controller: _tabController,
        children: [
          buildAppCards(),
          buildAppCards(type: 'apps'),
          buildAppCards(type: 'aiApps'),
        ],
      ),
    );
  }
}
