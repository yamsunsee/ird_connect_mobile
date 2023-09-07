import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _isLastPage = (index == 2);
                  });
                },
                children: VariablesConfig.onboardingPages.map((page) {
                  return Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        page.title.toUpperCase(),
                        style: StylesConfig.getTextStyleWithColor(context, 'h3', 'primary'),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Image.asset(
                        'assets/images/${page.image}',
                        height: 240,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        page.description,
                        style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary'),
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  );
                }).toList()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    _controller.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
                  },
                  child: Text('SKIP', style: StylesConfig.getTextStyle('h6'))),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: SwapEffect(
                  dotColor: StylesConfig.getColor(context, 'secondary'),
                  activeDotColor: StylesConfig.getColor(context, 'primary'),
                ),
                onDotClicked: (index) {
                  _controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
                },
              ),
              _isLastPage
                  ? TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, RoutesConfig.home);
                      },
                      child: Text('DONE', style: StylesConfig.getTextStyle('h6')))
                  : TextButton(
                      onPressed: () {
                        _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
                      },
                      child: Text('NEXT', style: StylesConfig.getTextStyle('h6'))),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
