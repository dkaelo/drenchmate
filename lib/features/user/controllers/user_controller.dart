import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/user_database.dart';

class UserController extends ChangeNotifier {
  User? _currentUser;
  String? _username;

  User? get currentUser => _currentUser;
  String? get username => _username;

  Future<bool> login(String username, String password) async {
    final user = await UserDatabase.getUserByUsername(username);
    if (user != null && user.password == password) {
      _currentUser = user;
      _username = username;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register(String username, String password) async {
    final existingUser = await UserDatabase.getUserByUsername(username);
    if (existingUser == null) {
      final newUser = User()
        ..username = username
        ..password = password
        ..isAdmin = false;
      
      await UserDatabase.addUser(newUser);
      return true;
    }
    return false;
  }

  void logout() {
    _currentUser = null;
    _username = null;
    notifyListeners();
  }
}
