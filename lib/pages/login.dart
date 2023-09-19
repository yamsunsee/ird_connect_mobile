import 'package:flutter/material.dart';
import 'package:ird_connect/components/index.dart';
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
                text: 'Login',
                type: TextType.extraLargeTitle,
                color: ColorType.gradient,
                isUpperCase: true,
              ),
              const SizedBox(height: 16),
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
                    icon: Icon(
                      _isRememberMe ? Icons.check_box : Icons.check_box_outline_blank,
                      color: _isRememberMe ? Theme.of(context).colorScheme.primary : Colors.grey,
                    ),
                    label: CustomText(
                      text: 'Remember Me',
                      color: _isRememberMe ? ColorType.primary : ColorType.paragraph,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const CustomText(
                      text: 'Forget Password?',
                      color: ColorType.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
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
                    text: 'Do not have an account?',
                    color: ColorType.paragraph,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RoutesConfig.register);
                    },
                    child: const CustomText(
                      text: 'Register',
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
