import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Introduction', style: StylesConfig.getTextStyle('h6')),
            Text(
              'Includes balance, wallet status on iRD Connect.',
              style: StylesConfig.getTextStyle('p'),
            ),
            Text(
              'You can also change the name or id of the wallet according to your style.',
              style: StylesConfig.getTextStyle('p'),
            ),
            const SizedBox(height: 16.0),
            // const ListTile(
            //   contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            //   horizontalTitleGap: -8.0,
            //   leading: Icon(Icons.numbers),
            //   title: Text('94f353b6-9999-4a81-Ba09-C63fb5778d02'),
            //   subtitle: Text('Card ID'),
            // ),
            // const ListTile(
            //   contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            //   horizontalTitleGap: -8.0,
            //   leading: Icon(Icons.person),
            //   title: Text('Pham The Hien'),
            //   subtitle: Text('Name'),
            // ),
            // const ListTile(
            //   contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            //   horizontalTitleGap: -8.0,
            //   leading: Icon(Icons.stacked_line_chart),
            //   title: Text('Active'),
            //   subtitle: Text('Status'),
            // ),
            // const ListTile(
            //   contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            //   horizontalTitleGap: -8.0,
            //   leading: Icon(Icons.monetization_on),
            //   title: Text('300 Credits'),
            //   subtitle: Text('Balance'),
            // ),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.indigo],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Pham The Hien'.toUpperCase(),
                        style: const TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w700),
                      ),
                      subtitle: const Text(
                        'Wallet Name',
                        style: TextStyle(color: Colors.white70),
                      ),
                      trailing: const Icon(Icons.stars, color: Colors.white),
                    ),
                    const ListTile(
                      title: Text(
                        '94f353b6-9999-4a81-Ba09-C63fb5778d02',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        'Card ID',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text('Active', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                            subtitle: Text(
                              'Status',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('Silver', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                            subtitle: Text(
                              'Rank',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('300', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                            subtitle: Text(
                              'Credits',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text('Transactions', style: StylesConfig.getTextStyle('h6')),
            Text(
              'Including transactions on iRD Connect.',
              style: StylesConfig.getTextStyle('p'),
            ),
            const SizedBox(height: 16.0),
            const ListTile(
              leading: Icon(Icons.arrow_circle_left, color: Colors.red),
              title: Text('Paid for Feature ABC'),
              subtitle: Text('12:00 - 11/08/2023'),
              trailing: Text('- 50 Credits'),
              horizontalTitleGap: -8.0,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            ),
            const ListTile(
              leading: Icon(Icons.arrow_circle_right, color: Colors.green),
              title: Text('Topped-up money to wallet'),
              subtitle: Text('20:00 - 10/08/2023'),
              trailing: Text('+ 300 Credits'),
              horizontalTitleGap: -8.0,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            )
          ],
        ),
      ),
    );
  }
}
