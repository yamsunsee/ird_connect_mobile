import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ird_connect/configs/index.dart';
import 'package:ird_connect/services/index.dart';
import 'package:ird_connect/providers/index.dart';

class UserService {
  static Future<void> register(BuildContext context, Map<String, String> formData) async {
    // final user = Provider.of<UserProvider>(context, listen: false);
    await Services.sendRequest(
      context: context,
      method: RequestMethod.postMethod,
      url: UrlsConfig.userRegister,
      body: formData,
      action: (data) {
        print(data);
      },
      redirect: () => Navigator.pushReplacementNamed(context, RoutesConfig.login),
    );
  }

  static Future<void> login(BuildContext context, Map<String, String> formData) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    await Services.sendRequest(
      context: context,
      method: RequestMethod.postMethod,
      url: UrlsConfig.userLogin,
      body: formData,
      action: (data) {
        user.token = data['tokenIssuer'];
        user.isLoggedIn = true;
      },
      redirect: () => Navigator.pushReplacementNamed(context, RoutesConfig.home),
    );
  }

  static void logout(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    user.isLoggedIn = false;
    user.token = '';
  }

  static Future<void> getInformation(BuildContext context) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    await Services.sendRequest(
      context: context,
      method: RequestMethod.getMethod,
      url: UrlsConfig.userInformation,
      action: (data) => user.setInformation = data['data'],
    );
  }
}
