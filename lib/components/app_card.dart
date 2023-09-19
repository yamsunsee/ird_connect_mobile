import 'package:flutter/material.dart';
import 'package:ird_connect/components/index.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/models/index.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.item});

  final App item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesConfig.details, arguments: item);
      },
      child: Container(
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).colorScheme.tertiary,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${item.image}',
              height: 48,
            ),
            const SizedBox(height: 8),
            CustomText(
              customSize: 8,
              text: item.title,
              align: TextAlign.center,
              color: ColorType.secondary,
              customWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
