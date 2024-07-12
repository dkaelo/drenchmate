import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  String _errorMessage = '';

  bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
    return regex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/drenchmate_logo.png',
                      fit: BoxFit.contain,
                      width: 500,
                      height: 380,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    if (userController.isFirstLogin)
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _newPasswordController,
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    const SizedBox(height: 20),
                    Text(_errorMessage, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (userController.isFirstLogin && !isValidPassword(_newPasswordController.text)) {
                            setState(() {
                              _errorMessage = 'Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.';
                            });
                            return;
                          }

                          final success = await userController.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                          if (success) {
                            if (userController.isFirstLogin) {
                              await userController.changePassword(_newPasswordController.text);
                            }
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const DashboardPage()),
                            );
                          } else {
                            setState(() {
                              _errorMessage = 'Invalid email or password';
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Login', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _errorMessage = '';
                        });
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Developed by Deads-X',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
