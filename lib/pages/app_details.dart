import 'package:flutter/material.dart';
import 'package:ird_connect/components/custom_button.dart';
import 'package:ird_connect/components/custom_icon.dart';
import 'package:ird_connect/components/custom_text.dart';
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
          appBar: AppBar(title: Text(item.title)),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Image.asset(
                'assets/images/${item.image}',
                height: 120,
              ),
              const SizedBox(height: 16),
              CustomText(
                text: item.title,
                type: TextType.title,
                color: ColorType.secondary,
              ),
              CustomText(
                text: item.brief,
                type: TextType.description,
                color: ColorType.paragraph,
              ),
              const SizedBox(height: 16),
              CustomButton(
                prefixIcon:
                    user.isLoggedIn ? (item.url.isNotEmpty ? Icons.developer_board : Icons.construction) : Icons.login,
                text: user.isLoggedIn ? (item.url.isNotEmpty ? 'Launch' : 'Developing') : 'Login',
                onPressed: () {
                  user.isLoggedIn
                      ? (item.url.isNotEmpty ? Navigator.pushNamed(context, item.url) : Navigator.pop(context))
                      : Navigator.pushNamed(context, RoutesConfig.login);
                },
              ),
              const SizedBox(height: 16),
              const CustomText(
                text: 'Introduction',
                type: TextType.subtitle,
                color: ColorType.secondary,
              ),
              CustomText(
                text: item.description,
                type: TextType.description,
                color: ColorType.paragraph,
              ),
              const SizedBox(height: 16),
              const CustomText(
                text: 'Features',
                type: TextType.subtitle,
                color: ColorType.secondary,
              ),
              buildFeatures(context, item.features),
              const SizedBox(height: 16),
              CustomText(
                text: item.type == 'App' ? 'Production Team' : 'Research Team',
                type: TextType.subtitle,
                color: ColorType.secondary,
              ),
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
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                const CustomIcon(icon: Icons.stars),
                const SizedBox(width: 4),
                Expanded(
                  child: CustomText(
                    text: feature,
                    type: TextType.description,
                    color: ColorType.paragraph,
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }

  buildTeam(BuildContext context, Map<String, List<String>> team) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: team.entries.map((entry) {
        return CustomText(
          text: '${entry.key}: ${entry.value.join(', ')}',
          color: ColorType.paragraph,
          type: TextType.description,
        );
      }).toList(),
    );
  }
}
