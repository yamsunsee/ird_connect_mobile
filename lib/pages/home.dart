import 'package:flutter/material.dart';
import 'package:ird_connect/components/app_card.dart';
import 'package:ird_connect/utils/index.dart';

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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/images/Logo.png', height: 32.0),
            const SizedBox(width: 8.0),
            const Text('iRD Connect')
          ],
        ),
        actions: [buildMenuOptions()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Connecting Strategies'.toUpperCase(),
                      style: Styles.h2p),
                  Text('Fortifying Defenses'.toUpperCase(), style: Styles.h2p),
                  Text('Your Cybersecurity Partner'.toUpperCase(),
                      style: Styles.h4s),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_moderator),
                      label: const Text('Get started for free'))
                ],
              ),
            ),
            Image.asset('assets/images/Onboarding.png', height: 200),
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
            builder: (_) => SizedBox(
                  height: 480,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login'.toUpperCase(),
                          style: Styles.h2p,
                        ),
                        const TextField(
                          // controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const TextField(
                          // controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  // _rememberMe = value!;
                                });
                              },
                            ),
                            const Text('Remember Me'),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                // Implement forget password functionality here
                              },
                              child: const Text('Forget Password?'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Submit'.toUpperCase(), style: Styles.h5),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Do not have an account?'),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Register'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
        icon: const Icon(Icons.app_registration),
        label: Text(
          'Login now'.toUpperCase(),
          style: Styles.h5,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildMenuOptions() {
    return PopupMenuButton(
      color: Colors.grey.shade200,
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
                horizontalTitleGap: -8.0,
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
                color: selectedOption == index ? Colors.white : Colors.indigo),
          ),
          avatar: Icon(
            option['icon'],
            color: selectedOption == index ? Colors.white : Colors.indigo,
          ),
          backgroundColor:
              selectedOption == index ? Colors.indigo : Colors.indigo.shade50,
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
