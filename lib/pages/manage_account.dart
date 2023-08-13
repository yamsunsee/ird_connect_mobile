import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manage Account'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text('Profile'.toUpperCase(), style: StylesConfig.getTextStyle('h6')),
              Text('Information', style: StylesConfig.getTextStyle('h6')),
              Text('Some information may be displayed in the applications within the iRD ecosystem.',
                  style: StylesConfig.getTextStyle('p')),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Display Name', style: StylesConfig.getTextStyle('p')),
                        Text('Full Name', style: StylesConfig.getTextStyle('p')),
                        Text('Gender', style: StylesConfig.getTextStyle('p')),
                        Text('Birthday', style: StylesConfig.getTextStyle('p'))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('HienPT', style: StylesConfig.getTextStyle('h6')),
                        Text('Pham The Hien', style: StylesConfig.getTextStyle('h6')),
                        Text('Male', style: StylesConfig.getTextStyle('h6')),
                        Text('01/01/2002', style: StylesConfig.getTextStyle('h6')),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              Text('Contact', style: StylesConfig.getTextStyle('h6')),
              Text(
                  'You can manage your contact information so that our team can provide better support and assistance to you.',
                  style: StylesConfig.getTextStyle('p')),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone', style: StylesConfig.getTextStyle('p')),
                        Text('Email', style: StylesConfig.getTextStyle('p')),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('+84123456789', style: StylesConfig.getTextStyle('h6')),
                        Text('phamthehien@gmail.com', style: StylesConfig.getTextStyle('h6')),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              Text('Address', style: StylesConfig.getTextStyle('h6')),
              Text('Your home and office addresses are used to personalize your experience within our ecosystem.',
                  style: StylesConfig.getTextStyle('p')),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Home', style: StylesConfig.getTextStyle('p')),
                        Text('Office', style: StylesConfig.getTextStyle('p')),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ben Tre Province', style: StylesConfig.getTextStyle('h6')),
                        Text('HPT Vietnam Corporation', style: StylesConfig.getTextStyle('h6')),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(),
              Text('Security'.toUpperCase(), style: StylesConfig.getTextStyle('h6')),
              Text('We recommend updating this information to make sure your iRD Account is accessible at all times.',
                  style: StylesConfig.getTextStyle('p')),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Two Factor', style: StylesConfig.getTextStyle('p')),
                        Text('Password', style: StylesConfig.getTextStyle('p')),
                        Text('Recovery Email', style: StylesConfig.getTextStyle('p')),
                        Text('Recovery Phone', style: StylesConfig.getTextStyle('p')),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disabled', style: StylesConfig.getTextStyle('h6')),
                        Text('Not changed yet', style: StylesConfig.getTextStyle('h6')),
                        Text('Not set', style: StylesConfig.getTextStyle('h6')),
                        Text('Not set', style: StylesConfig.getTextStyle('h6')),
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
