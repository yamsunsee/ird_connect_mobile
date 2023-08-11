import 'package:flutter/material.dart';
import 'package:ird_connect/pages/index.dart';
import 'package:ird_connect/utils/index.dart';

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
        color: Colors.indigo.shade50,
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
                  style: Styles.h6p,
                ),
              ])),
        ),
      ),
    );
  }
}
