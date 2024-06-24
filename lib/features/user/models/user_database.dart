import 'package:isar/isar.dart';
import 'package:drenchmate/features/user/models/user.dart';
import 'package:drenchmate/services/database_service.dart';

class UserDatabase {
  static Future<void> initialize() async {
    final isar = DatabaseService.isar;

    // Create default admin user if not exists
    final adminExists = await isar.users.where().filter().usernameEqualTo('admin').findFirst();
    if (adminExists == null) {
      final adminUser = User()
        ..username = 'admin'
        ..password = 'admin' // You might want to hash this password
        ..isAdmin = true;

      await isar.writeTxn(() async {
        await isar.users.put(adminUser);
      });
    }
  }

  static Future<User?> getUserByUsername(String username) async {
    final isar = DatabaseService.isar;
    return await isar.users.where().filter().usernameEqualTo(username).findFirst();
  }

  static Future<void> addUser(User user) async {
    final isar = DatabaseService.isar;
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });
  }
}
