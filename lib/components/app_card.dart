import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesConfig.details, arguments: item);
      },
      child: AspectRatio(
        aspectRatio: 2,
        child: Card(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/${item['image']}',
                        height: 64,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 8.0),
                        // style: StylesConfig.getTextStyle('p'),
                      ),
                    ])),
          ),
        ),
      ),
    );
  }
}
