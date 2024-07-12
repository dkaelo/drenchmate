import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/user/controllers/user_controller.dart';
import 'package:drenchmate/features/user/views/login_page.dart';
import 'package:drenchmate/features/user/views/user_account_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            userController.logout();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserAccountPage()),
            );
          },
        ),
      ],
    );
  }
}
