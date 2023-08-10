import 'package:flutter/material.dart';
import 'package:ird_connect/pages/index.dart';
import 'package:ird_connect/utils/constants.dart';
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
      body: Stack(
        children: [
          PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _isLastPage = (index == 2);
                });
              },
              children: onboardingPages.map((page) {
                return Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          page['title'].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 32.0,
                        ),
                        Image.asset('assets/images/${page['image']}'),
                        const SizedBox(
                          height: 32.0,
                        ),
                        Text(
                          page['descriptions'],
                          style: const TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                );
              }).toList()),
          Container(
              alignment: const Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        _controller.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                      },
                      child: const Text('SKIP')),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const JumpingDotEffect(),
                    onDotClicked: (index) {
                      _controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut);
                    },
                  ),
                  _isLastPage
                      ? TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          },
                          child: const Text('DONE'))
                      : TextButton(
                          onPressed: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeOut);
                          },
                          child: const Text('NEXT')),
                ],
              ))
        ],
      ),
    );
  }
}
