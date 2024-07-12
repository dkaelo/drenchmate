import 'package:drenchmate/utils/widgets/custom_app_bar.dart.dart';
import 'package:flutter/material.dart';
import 'package:drenchmate/utils/widgets/custom_bottom_navigation_bar.dart';
import 'package:drenchmate/features/chemical/views/drench_group_page.dart';
import 'package:drenchmate/features/record/views/data_page.dart';
import 'package:drenchmate/features/chemical/views/chemical_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Welcome to Drenchmate!', style: TextStyle(fontSize: 24))),
    DataPage(),
    ChemicalPage(),
    DrenchGroupPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
