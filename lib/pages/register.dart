import 'package:flutter/material.dart';
import 'package:ird_connect/components/index.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/services/index.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isHidePassword = true;

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName.';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password.';
    } else if (value != _passwordController.text) {
      return 'Password & confirm password do not match.';
    }
    return null;
  }

  void _submit(context) {
    if (_formKey.currentState!.validate()) {
      final formData = {
        'email': _emailController.text,
        'password': _passwordController.text,
        'last_name': _lastNameController.text,
        'first_name': _firstNameController.text,
        'display_name': _displayNameController.text,
      };
      UserService.register(context, formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iRD Connect'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Register',
                type: TextType.extraLargeTitle,
                color: ColorType.gradient,
                isUpperCase: true,
              ),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Icons.perm_contact_cal),
                    ),
                    validator: (value) => _validateRequired(value, 'first name'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: (value) => _validateRequired(value, 'last name'),
                  ),
                )
              ]),
              const SizedBox(height: 16),
              TextFormField(
                controller: _displayNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  labelText: 'Display Name',
                  prefixIcon: Icon(Icons.screenshot_monitor),
                ),
                validator: (value) => _validateRequired(value, 'display name'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) => _validateRequired(value, 'email'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isHidePassword = !_isHidePassword;
                      });
                    },
                    icon: Icon(_isHidePassword ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                obscureText: _isHidePassword,
                validator: (value) => _validateRequired(value, 'password'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.enhanced_encryption),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isHidePassword = !_isHidePassword;
                      });
                    },
                    icon: Icon(_isHidePassword ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                obscureText: _isHidePassword,
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Submit',
                size: SizeType.large,
                onPressed: () {
                  _submit(context);
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'Already have an account?',
                    color: ColorType.paragraph,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RoutesConfig.login);
                    },
                    child: const CustomText(
                      text: 'Login',
                      color: ColorType.primary,
                      customWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
