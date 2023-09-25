import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ird_connect/models/index.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:ird_connect/components/index.dart';

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

  late int _currentPage = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final App item = _getProps(context);

    return Consumer<UserProvider>(
      builder: (context, user, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          appBar: AppBar(title: Text(item.title)),
          body: Stack(
            children: [
              ClipPath(
                clipper: CustomBackground(),
                child: Container(
                  height: 100,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Image.asset(
                            'assets/images/${item.image}',
                            height: 80,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomText(
                      text: item.title,
                      type: TextType.title,
                      color: ColorType.secondary,
                      align: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      text: item.brief,
                      type: TextType.description,
                      color: ColorType.paragraph,
                      align: TextAlign.center,
                      isItalic: true,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      prefixIcon: user.isLoggedIn
                          ? (item.url.isNotEmpty ? Icons.developer_board : Icons.construction)
                          : Icons.login,
                      text: user.isLoggedIn
                          ? (item.url.isNotEmpty ? 'Launch application' : 'Application is in development')
                          : 'Login to launch application',
                      onPressed: () {
                        user.isLoggedIn
                            ? (item.url.isNotEmpty ? Navigator.pushNamed(context, item.url) : Navigator.pop(context))
                            : Navigator.pushNamed(context, RoutesConfig.login);
                      },
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: PageView(
                        controller: _controller,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        children: [
                          buildSection(
                            context,
                            [
                              const CustomText(
                                text: 'Introduction',
                                type: TextType.subtitle,
                                color: ColorType.secondary,
                              ),
                              const SizedBox(height: 4),
                              CustomText(
                                text: item.description,
                                type: TextType.description,
                                color: ColorType.secondary,
                              ),
                            ],
                          ),
                          buildSection(
                            context,
                            [
                              const CustomText(
                                text: 'Features',
                                type: TextType.subtitle,
                                color: ColorType.secondary,
                              ),
                              const SizedBox(height: 4),
                              buildFeatures(context, item.features),
                            ],
                          ),
                          buildSection(
                            context,
                            [
                              CustomText(
                                text: item.type == 'App' ? 'Production Team' : 'Research Team',
                                type: TextType.subtitle,
                                color: ColorType.secondary,
                              ),
                              const SizedBox(height: 4),
                              buildTeam(context, item.team),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            index: _currentPage,
            animationDuration: const Duration(milliseconds: 300),
            color: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            items: const [
              Icon(Icons.feed_rounded),
              Icon(Icons.interests_rounded),
              Icon(Icons.diversity_3_rounded),
            ],
            onTap: (index) {
              _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
          ),
        );
      },
    );
  }

  Widget buildSection(BuildContext context, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
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
                    color: ColorType.secondary,
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
          color: ColorType.secondary,
          type: TextType.description,
        );
      }).toList(),
    );
  }
}

class CustomBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path();

    path.lineTo(0, height);
    path.quadraticBezierTo(0, height - 32, 32, height - 32);
    path.lineTo(width - 32, height - 32);
    path.quadraticBezierTo(width, height - 32, width, height);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
