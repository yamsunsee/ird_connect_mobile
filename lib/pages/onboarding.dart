import 'package:flutter/material.dart';
import 'package:ird_connect/components/index.dart';
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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 320,
              color: Colors.blue.shade100,
            ),
          ),
          Positioned(
            top: 80,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotColor: Colors.blue.shade50,
                activeDotColor: Colors.blue.shade50,
              ),
              onDotClicked: (index) {
                _controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
              },
            ),
          ),
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _isLastPage = (index == 2);
              });
            },
            children: VariablesConfig.onboardingPages.map(
              (page) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/${page.image}',
                      height: 320,
                    ),
                    CustomText(
                      text: page.title,
                      isUpperCase: true,
                      color: ColorType.primary,
                      type: TextType.extraLargeTitle,
                      align: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    CustomText(
                      text: page.description,
                      color: ColorType.paragraph,
                      align: TextAlign.center,
                    ),
                  ],
                );
              },
            ).toList(),
          ),
          Positioned(
            bottom: 40,
            child: GestureDetector(
              onTap: () {
                _isLastPage
                    ? Navigator.pop(context)
                    : _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      );
              },
              child: Container(
                width: 240,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.lightBlueAccent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: _isLastPage ? 'Explore now' : 'Next',
                      customColor: Colors.white,
                      type: TextType.subtitle,
                      isUpperCase: true,
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path();

    path.lineTo(0, height);
    path.quadraticBezierTo(width * 0.5, height - 80, width, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
