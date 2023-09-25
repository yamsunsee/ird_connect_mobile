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
                _controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
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
                      color: ColorType.gradient,
                      type: TextType.extraLargeTitle,
                      align: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    CustomText(
                      text: page.description,
                      color: ColorType.paragraph,
                      align: TextAlign.center,
                      isItalic: true,
                    ),
                  ],
                );
              },
            ).toList(),
          ),
          Positioned(
            bottom: 40,
            child: CustomButton(
              text: _isLastPage ? 'Explore now' : 'Next',
              width: 240,
              size: SizeType.large,
              onPressed: () {
                _isLastPage
                    ? Navigator.pop(context)
                    : _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
              },
              suffixIcon: Icons.arrow_right_alt_rounded,
            ),
          ),
          // Visibility(
          //   visible: _isLastPage,
          //   child: Positioned(
          //     bottom: 20,
          //     child: TextButton(
          //       onPressed: () {
          //         _localStorage.put('isVisited', true);
          //       },
          //       child: const CustomText(
          //         text: 'Do not show again',
          //         color: ColorType.paragraph,
          //       ),
          //     ),
          //   ),
          // ),
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
