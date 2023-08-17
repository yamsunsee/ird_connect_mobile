import 'package:flutter/material.dart';
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
        title: Wrap(
          spacing: 8.0,
          children: [
            Image.asset('assets/images/Logo.png', height: 32.0),
            const Text('iRD Connect'),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register'.toUpperCase(),
                style: StylesConfig.getTextStyleWithColor(context, 'h2', 'primary'),
              ),
              const SizedBox(height: 16.0),
              Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) => _validateRequired(value, 'first name'),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      // prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) => _validateRequired(value, 'last name'),
                  ),
                )
              ]),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _displayNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  labelText: 'Display Name',
                  prefixIcon: Icon(Icons.screenshot_monitor),
                ),
                validator: (value) => _validateRequired(value, 'display name'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) => _validateRequired(value, 'email'),
              ),
              const SizedBox(height: 16.0),
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
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock_clock_rounded),
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
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  _submit(context);
                  // Navigator.pushNamed(context, RoutesConfig.home);
                },
                child: Text('Submit'.toUpperCase(), style: StylesConfig.getTextStyle('h6')),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesConfig.login);
                    },
                    child: const Text('Login'),
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
