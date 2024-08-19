// lib/providers/user_provider.dart

import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _userName = '';
  String _userEmail = '';
  bool _isAuthenticated = false;

  String get userName => _userName;
  String get userEmail => _userEmail;
  bool get isAuthenticated => _isAuthenticated;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setUserEmail(String email) {
    _userEmail = email;
    notifyListeners();
  }

  void authenticateUser(String name, String email) {
    _userName = name;
    _userEmail = email;
    _isAuthenticated = true;
    notifyListeners();
  }

  void signOut() {
    _userName = '';
    _userEmail = '';
    _isAuthenticated = false;
    notifyListeners();
  }
}
