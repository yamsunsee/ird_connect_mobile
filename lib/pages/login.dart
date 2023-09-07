import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/services/index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isHidePassword = true;
  bool _isRememberMe = false;

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName.';
    }
    return null;
  }

  void _submit(context) {
    if (_formKey.currentState!.validate()) {
      final credentials = {
        'email': _emailController.text,
        'password': _passwordController.text,
      };
      UserService.login(context, credentials);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          spacing: 8.0,
          children: [
            Image.asset('assets/images/Logo.png', height: 32),
            const Text('iRD Connect'),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login'.toUpperCase(),
                style: StylesConfig.getTextStyleWithColor(context, 'h2', 'primary'),
              ),
              TextFormField(
                controller: _emailController,
                validator: (value) => _validateRequired(value, 'email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                validator: (value) => _validateRequired(value, 'password'),
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
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _isRememberMe = !_isRememberMe;
                        });
                      },
                      icon: Icon(_isRememberMe ? Icons.check_box : Icons.check_box_outline_blank,
                          color: StylesConfig.getColor(context, _isRememberMe ? 'primary' : 'secondary')),
                      label: Text(
                        'Remember Me',
                        style:
                            StylesConfig.getTextStyleWithColor(context, 'p', _isRememberMe ? 'primary' : 'secondary'),
                      )),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // TODO: Forgot password function
                    },
                    child: const Text('Forget Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _submit(context);
                  // Navigator.pushNamed(context, RoutesConfig.home);
                },
                child: Text('Submit'.toUpperCase(), style: StylesConfig.getTextStyle('h6')),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do not have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RoutesConfig.register);
                    },
                    child: const Text('Register'),
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
