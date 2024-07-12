import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drenchmate/features/user/models/user.dart';
import 'package:drenchmate/features/chemical/models/chemical.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
  static late Isar isar;

  static Future<void> initialize() async {
     WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}
