import 'package:flutter/material.dart';
import 'package:ird_connect/components/app_card.dart';
import 'package:ird_connect/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('iRD Connect'),
        actions: [buildMenuOptions()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Register now to receive our offers'.toUpperCase(),
              style: const TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 32.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Image.asset(
              'assets/images/Onboarding.png',
              height: 200,
            ),
            buildFilterOptions(),
            buildAppCards(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
            ),
            context: context,
            builder: (_) => const SizedBox(
                  height: 500,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Login form',
                            style: TextStyle(
                              fontSize: 32.0,
                            )),
                      ],
                    ),
                  ),
                )),
        icon: const Icon(Icons.login),
        label: Text(
          'Login now'.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildMenuOptions() {
    return PopupMenuButton(
      icon: const Icon(Icons.menu),
      itemBuilder: (context) => menuOptions
          .map(
            (option) => PopupMenuItem(
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  if (option['page'] != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => option['page']));
                  }
                },
                leading: Icon(option['icon']),
                title: Text(option['title']),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget buildFilterOptions() {
    return Wrap(
      spacing: 8.0,
      children: filterOptions.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> option = entry.value;
        int count = index == 1
            ? apps.length
            : index == 2
                ? aiApps.length
                : apps.length + aiApps.length;

        return ActionChip(
          label: Text(
            '${option['title']} ($count)',
            style: TextStyle(
                color:
                    selectedOption == index ? Colors.white : Colors.grey[600]),
          ),
          avatar: Icon(
            option['icon'],
            color: selectedOption == index ? Colors.white : Colors.grey[600],
          ),
          backgroundColor:
              selectedOption == index ? Colors.blue : Colors.grey[300],
          onPressed: () {
            setState(() {
              selectedOption = index;
            });
          },
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        );
      }).toList(),
    );
  }

  Widget buildAppCards() {
    List<Map<String, dynamic>> cards = selectedOption == 1
        ? apps
        : selectedOption == 2
            ? aiApps
            : [...apps, ...aiApps];

    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: cards.map((app) => AppCard(item: app)).toList(),
      ),
    );
  }
}
