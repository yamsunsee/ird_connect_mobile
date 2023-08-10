import 'package:flutter/material.dart';
import 'package:ird_connect/pages/index.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AppDetails(item: item)));
      },
      child: Card(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Expanded(
                  child: Image.asset('assets/images/${item['image']}'),
                ),
                const SizedBox(height: 20),
                Text(
                  item['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ])),
        ),
      ),
    );
  }
}
