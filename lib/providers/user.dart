import 'package:flutter/material.dart';
import 'package:ird_connect/models/index.dart';

class UserProvider with ChangeNotifier {
  late bool _isLoggedIn = false;
  late String _token = '';
  final _user = User();

  bool get isLoggedIn => _isLoggedIn;
  String get token => _token;
  User get information => _user;

  set isLoggedIn(bool newState) {
    _isLoggedIn = newState;
    notifyListeners();
  }

  set token(String newToken) {
    _token = newToken;
    notifyListeners();
  }

  set setInformation(Map<String, dynamic> newUser) {
    _user.updateInformation(newUser);
    notifyListeners();
  }
}
