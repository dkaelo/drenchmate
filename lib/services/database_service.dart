import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drenchmate/features/record/models/record.dart';
import 'package:drenchmate/features/user/models/user.dart';
import 'package:drenchmate/features/chemical/models/chemical.dart';

class DatabaseService {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UserSchema, RecordSchema, ChemicalSchema],
      directory: dir.path,
      maxSizeMiB: 512,
    );
  }
}
