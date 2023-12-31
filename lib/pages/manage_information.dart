import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/providers/index.dart';
import 'package:provider/provider.dart';

class ManageInformation extends StatefulWidget {
  const ManageInformation({super.key});

  @override
  State<ManageInformation> createState() => _ManageInformationState();
}

class _ManageInformationState extends State<ManageInformation> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, user, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Manage Personal Information'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    _edit(context, user);
                  },
                  icon: const Icon(Icons.edit_note))
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Information', style: StylesConfig.getTextStyle('h6')),
              Text('Some information may be displayed in the applications within the iRD ecosystem.',
                  style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary')),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.perm_contact_cal),
                title: Text(user.information.fullName),
                subtitle: const Text('Full Name'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8,
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: const Icon(Icons.screenshot_monitor),
                title: Text(user.information.displayName),
                subtitle: const Text('Display Name'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8,
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: const Icon(Icons.accessibility),
                title: Text(user.information.gender.isNotEmpty ? user.information.gender : 'Unset'),
                subtitle: const Text('Gender'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8,
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: const Icon(Icons.cake),
                title: Text(user.information.dateOfBirth.isNotEmpty ? user.information.dateOfBirth : 'Unset'),
                subtitle: const Text('Birthday'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8,
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 16),
              Text('Contact', style: StylesConfig.getTextStyle('h6')),
              Text(
                  'You can manage your contact information so that our team can provide better support and assistance to you.',
                  style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary')),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(user.information.phoneNumber.isNotEmpty ? user.information.phoneNumber : 'Unset'),
                subtitle: const Text('Phone Number'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8,
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(user.information.email.isNotEmpty ? user.information.email : 'Unset'),
                subtitle: const Text('Email'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8,
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 16),
              Text('Address', style: StylesConfig.getTextStyle('h6')),
              Text('Your home and office addresses are used to personalize your experience within our ecosystem.',
                  style: StylesConfig.getTextStyleWithColor(context, 'p', 'secondary')),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.home),
                title: Text(user.information.address1.isNotEmpty ? user.information.address1 : 'Unset'),
                subtitle: const Text('Home'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8,
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title: Text(user.information.address2.isNotEmpty ? user.information.address2 : 'Unset'),
                subtitle: const Text('Office'),
                // trailing: const Icon(Icons.more_vert),
                horizontalTitleGap: -8,
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _edit(BuildContext context, UserProvider user) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController displayNameController = TextEditingController(text: user.information.displayName);
    final TextEditingController firstNameController = TextEditingController(text: user.information.firstName);
    final TextEditingController lastNameController = TextEditingController(text: user.information.lastName);
    final TextEditingController genderController = TextEditingController(text: user.information.gender);
    final TextEditingController birthdayController = TextEditingController(text: user.information.dateOfBirth);
    final TextEditingController phoneNumberController = TextEditingController(text: user.information.phoneNumber);
    final TextEditingController emailController = TextEditingController(text: user.information.email);
    final TextEditingController address1Controller = TextEditingController(text: user.information.address1);
    final TextEditingController address2Controller = TextEditingController(text: user.information.address2);

    void submit(context) {
      if (formKey.currentState!.validate()) {
        final formData = {
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'display_name': displayNameController.text,
          'address_1': address1Controller.text,
          'address_2': address2Controller.text,
          'date_of_birth': birthdayController.text,
          'phone_number': phoneNumberController.text,
        };
        print(formData);
        // UserService.updateInformation(context, formData);
      }
    }

    String? validateRequired(String? value, String fieldName) {
      if (value == null || value.isEmpty) {
        return 'Please enter your $fieldName.';
      }
      return null;
    }

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Edit'.toUpperCase(),
                    style: StylesConfig.getTextStyleWithColor(context, 'h2', 'primary'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Information', style: StylesConfig.getTextStyle('h6')),
                        Row(children: [
                          Expanded(
                            child: TextFormField(
                              controller: firstNameController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                labelText: 'First Name',
                                prefixIcon: Icon(Icons.perm_contact_cal),
                              ),
                              validator: (value) => validateRequired(value, 'first name'),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: lastNameController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                labelText: 'Last Name',
                                // prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) => validateRequired(value, 'last name'),
                            ),
                          )
                        ]),
                        TextFormField(
                          controller: displayNameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            labelText: 'Display Name',
                            prefixIcon: Icon(Icons.screenshot_monitor),
                          ),
                          validator: (value) => validateRequired(value, 'display name'),
                        ),
                        DropdownButtonFormField<String>(
                          onChanged: (newValue) {
                            genderController.text = newValue!;
                          },
                          items: ['Male', 'Female', 'Other'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            labelText: 'Gender',
                            prefixIcon: Icon(Icons.accessibility),
                          ),
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: birthdayController,
                          decoration: const InputDecoration(
                            labelText: 'Birthday',
                            prefixIcon: Icon(Icons.cake),
                          ),
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (selectedDate != null) {
                              birthdayController.text = selectedDate.toString().split(' ')[0];
                            }
                          },
                        ),
                        const SizedBox(height: 32),
                        Text('Contact', style: StylesConfig.getTextStyle('h6')),
                        TextFormField(
                          controller: phoneNumberController,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: Icon(Icons.phone),
                          ),
                          keyboardType: TextInputType.phone, // Use the phone keyboard
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress, // Use the email keyboard
                        ),
                        const SizedBox(height: 32),
                        Text('Address', style: StylesConfig.getTextStyle('h6')),
                        TextFormField(
                          controller: address1Controller,
                          decoration: const InputDecoration(
                            labelText: 'Home',
                            prefixIcon: Icon(Icons.home),
                          ),
                        ),
                        TextFormField(
                          controller: address2Controller,
                          decoration: const InputDecoration(
                            labelText: 'Office',
                            prefixIcon: Icon(Icons.work),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      submit(context);
                      Navigator.pop(context);
                    },
                    child: Text('Submit'.toUpperCase(), style: StylesConfig.getTextStyle('h6')),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
