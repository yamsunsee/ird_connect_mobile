import 'package:flutter/material.dart';
import 'package:ird_connect/components/index.dart';
import 'package:ird_connect/configs/index.dart';

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
        title: Wrap(
          spacing: 8.0,
          children: [
            Image.asset('assets/images/Logo.png', height: 32.0),
            const Text('iRD Connect')
          ],
        ),
        actions: [buildMenuOptions(context)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Connecting Strategies'.toUpperCase(),
                      style: StylesConfig.getTextStyleWithColor(
                          context, 'h3', 'primary')),
                  Text('Fortifying Defenses'.toUpperCase(),
                      style: StylesConfig.getTextStyleWithColor(
                          context, 'h3', 'primary')),
                  Text('Your Cybersecurity Partner'.toUpperCase(),
                      style: StylesConfig.getTextStyleWithColor(
                          context, 'h6', 'secondary')),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesConfig.register);
                    },
                    icon: const Icon(Icons.add_moderator),
                    label: const Text('Get started for free'),
                  ),
                ],
              ),
            ),
            Image.asset('assets/images/Onboarding.png', height: 160),
            buildFilterOptions(context),
            buildAppCards(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => showModalBottomSheet(
      //       isScrollControlled: true,
      //       shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.vertical(
      //           top: Radius.circular(16.0),
      //         ),
      //       ),
      //       context: context,
      //       builder: (_) => SizedBox(
      //             height: 480,
      //             child: Padding(
      //               padding: const EdgeInsets.all(16.0),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     'Login'.toUpperCase(),
      //                     style: StylesConfig.getTextStyleWithColor(
      //                         context, 'h2', 'primary'),
      //                   ),
      //                   const TextField(
      //                     // controller: _emailController,
      //                     decoration: InputDecoration(
      //                       labelText: 'Email',
      //                       prefixIcon: Icon(Icons.email),
      //                     ),
      //                   ),
      //                   const SizedBox(height: 16.0),
      //                   const TextField(
      //                     // controller: _passwordController,
      //                     decoration: InputDecoration(
      //                       labelText: 'Password',
      //                       prefixIcon: Icon(Icons.lock),
      //                     ),
      //                     obscureText: true,
      //                   ),
      //                   const SizedBox(height: 16.0),
      //                   Row(
      //                     children: [
      //                       Checkbox(
      //                         value: true,
      //                         onChanged: (value) {
      //                           setState(() {
      //                             // _rememberMe = value!;
      //                           });
      //                         },
      //                       ),
      //                       const Text('Remember Me'),
      //                       const Spacer(),
      //                       TextButton(
      //                         onPressed: () {
      //                           // Implement forget password functionality here
      //                         },
      //                         child: const Text('Forget Password?'),
      //                       ),
      //                     ],
      //                   ),
      //                   const SizedBox(height: 16.0),
      //                   ElevatedButton(
      //                     onPressed: () {
      //                       Navigator.pop(context);
      //                     },
      //                     child: Text('Submit'.toUpperCase(),
      //                         style: StylesConfig.getTextStyle('h6')),
      //                   ),
      //                   const SizedBox(height: 16.0),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       const Text('Do not have an account?'),
      //                       TextButton(
      //                         onPressed: () {
      //                           Navigator.pushNamed(
      //                               context, RoutesConfig.register);
      //                         },
      //                         child: const Text('Register'),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           )),
      //   icon: const Icon(Icons.app_registration),
      //   label: Text('Login now'.toUpperCase(),
      //       style: StylesConfig.getTextStyle('h6')),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget buildMenuOptions(BuildContext context) {
    return PopupMenuButton(
      // color: StylesConfig.getColor(context, 'background'),
      icon: const Icon(Icons.menu),
      itemBuilder: (context) => VariablesConfig.menuOptions
          .map(
            (option) => PopupMenuItem(
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  // option['page'] == null
                  //     ? showModalBottomSheet(
                  //         context: context,
                  //         builder: (context) => Padding(
                  //               padding: const EdgeInsets.all(16.0),
                  //               child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: [
                  //                     const CircularProgressIndicator(),
                  //                     const SizedBox(height: 16),
                  //                     Text('Logging out...',
                  //                         style:
                  //                             StylesConfig.getTextStyle('h6'))
                  //                   ]),
                  //             ))
                  //     :
                  Navigator.pushNamed(context, option['page']);
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

  Widget buildFilterOptions(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: VariablesConfig.filterOptions.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> option = entry.value;
        int count = index == 1
            ? VariablesConfig.apps.length
            : index == 2
                ? VariablesConfig.aiApps.length
                : VariablesConfig.apps.length + VariablesConfig.aiApps.length;

        return ActionChip(
          label: Text(
            '${option['title']} ($count)',
            style: TextStyle(
                color: selectedOption == index
                    ? Colors.white
                    : StylesConfig.getColor(context, 'primary')),
          ),
          avatar: Icon(
            option['icon'],
            color: selectedOption == index
                ? Colors.white
                : StylesConfig.getColor(context, 'primary'),
          ),
          backgroundColor: selectedOption == index
              ? StylesConfig.getColor(context, 'primary')
              : StylesConfig.getColor(context, 'primary').withAlpha(50),
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
