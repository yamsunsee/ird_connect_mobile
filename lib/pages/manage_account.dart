import 'package:flutter/material.dart';
import 'package:ird_connect/utils/index.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Manage Account'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text('Profile'.toUpperCase(), style: Styles.h4p),
              const Text('Information', style: Styles.h5),
              const Text(
                  'Some information may be displayed in the applications within the iRD ecosystem.',
                  style: Styles.p),
              const SizedBox(height: 8.0),
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Display Name', style: Styles.p),
                        Text('Full Name', style: Styles.p),
                        Text('Gender', style: Styles.p),
                        Text('Birthday', style: Styles.p)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('HienPT', style: Styles.h6),
                        Text('Pham The Hien', style: Styles.h6),
                        Text('Male', style: Styles.h6),
                        Text('01/01/2002', style: Styles.h6),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              const Text('Contact', style: Styles.h5),
              const Text(
                  'You can manage your contact information so that our team can provide better support and assistance to you.',
                  style: Styles.p),
              const SizedBox(height: 8.0),
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone', style: Styles.p),
                        Text('Email', style: Styles.p),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('+84123456789', style: Styles.h6),
                        Text('phamthehien@gmail.com', style: Styles.h6),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              const Text('Address', style: Styles.h5),
              const Text(
                  'Your home and office addresses are used to personalize your experience within our ecosystem.',
                  style: Styles.p),
              const SizedBox(height: 8.0),
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Home', style: Styles.p),
                        Text('Office', style: Styles.p),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ben Tre Province', style: Styles.h6),
                        Text('HPT Vietnam Corporation', style: Styles.h6),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(),
              Text('Security'.toUpperCase(), style: Styles.h4p),
              const Text(
                  'We recommend updating this information to make sure your iRD Account is accessible at all times.',
                  style: Styles.p),
              const SizedBox(height: 8.0),
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Two Factor', style: Styles.p),
                        Text('Password', style: Styles.p),
                        Text('Recovery Email', style: Styles.p),
                        Text('Recovery Phone', style: Styles.p),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disabled', style: Styles.h6),
                        Text('Not changed yet', style: Styles.h6),
                        Text('Not set', style: Styles.h6),
                        Text('Not set', style: Styles.h6),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
