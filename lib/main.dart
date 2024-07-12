import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/user/controllers/user_controller.dart';
import 'features/record/controllers/record_controller.dart';
import 'features/chemical/controllers/chemical_controller.dart';
import 'features/chemical/controllers/drench_group_controller.dart';
import 'features/user/views/login_page.dart';
import 'features/user/views/dashboard_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => RecordController()),
        ChangeNotifierProvider(create: (context) => ChemicalController()),
        ChangeNotifierProvider(create: (context) => DrenchGroupController()),
      ],
      child: MaterialApp(
        title: 'Drenchmate',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthHandler(),
      ),
    );
  }
}

class AuthHandler extends StatelessWidget {
  const AuthHandler({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    return userController.currentUser == null ? const LoginPage() : const DashboardPage();
  }
}
