import 'package:flutter/material.dart';
import 'package:ird_connect/configs/index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login'.toUpperCase(),
              style:
                  StylesConfig.getTextStyleWithColor(context, 'h2', 'primary'),
            ),
            const TextField(
              // controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              // controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {
                    setState(() {
                      // _rememberMe = value!;
                    });
                  },
                ),
                const Text('Remember Me'),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // TODO: Forgot password function
                  },
                  child: const Text('Forget Password?'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesConfig.home);
              },
              child: Text('Submit'.toUpperCase(),
                  style: StylesConfig.getTextStyle('h6')),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesConfig.register);
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
