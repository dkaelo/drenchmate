import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/record/controllers/record_controller.dart';
import 'package:drenchmate/features/record/models/record_database.dart';
import 'package:drenchmate/features/record/views/data_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await RecordDatabase.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecordController(),
      child: MaterialApp(
        title: 'Drenchmate',
        theme: ThemeData( 
          primarySwatch: Colors.blue,
        ),
        home: const DataPage(),
      ),
    );
  }
}
