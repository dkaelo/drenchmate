import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/record/controllers/record_controller.dart';
import 'package:drenchmate/features/chemical/controllers/chemical_controller.dart';
import 'package:drenchmate/features/user/controllers/user_controller.dart';
import 'package:drenchmate/features/user/models/user_database.dart';
import 'package:drenchmate/features/user/views/login_page.dart';
import 'package:drenchmate/features/user/views/dashboard_page.dart';
import 'package:drenchmate/features/record/views/data_page.dart';
import 'package:drenchmate/features/chemical/views/chemical_page.dart';
import 'package:drenchmate/services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await DatabaseService.initialize();
  await UserDatabase.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecordController()),
        ChangeNotifierProvider(create: (context) => ChemicalController()),
        ChangeNotifierProvider(create: (context) => UserController()),
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
    return userController.currentUser == null ? const LoginPage() : const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    DataPage(),
    ChemicalPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drenchmate'),
        centerTitle: true,
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
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: 'Chemicals',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
