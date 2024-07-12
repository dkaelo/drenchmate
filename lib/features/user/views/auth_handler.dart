import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';
import 'login_page.dart';
import 'dashboard_page.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    return userController.currentUser == null ? const LoginPage() : const DashboardPage();
  }
}
