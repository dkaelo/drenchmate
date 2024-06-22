import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drenchmate/features/record/models/record.dart';

class DatabaseService {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [RecordSchema],
      directory: dir.path,
      maxSizeMiB: 512,
    );
  }
}
