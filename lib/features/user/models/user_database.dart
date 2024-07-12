import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabase {
  static final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  static Future<void> initialize() async {
    // Check if any user exists in the users collection
    final querySnapshot = await usersCollection.limit(1).get();

    // If the collection is empty, add the default admin user
    if (querySnapshot.docs.isEmpty) {
      final adminUser = {
        'username': 'admin@drenchmate.com',
        'displayName': 'Administrator',
        'role': 'admin',
      };
      await usersCollection.add(adminUser);
    }
  }

  // Uncomment if you have roles stored in Firestore
  // static Future<String?> getUserRole(String username) async {
  //   final querySnapshot = await usersCollection.where('username', isEqualTo: username).limit(1).get();
  //   if (querySnapshot.docs.isEmpty) {
  //     return null;
  //   } else {
  //     final doc = querySnapshot.docs.first;
  //     return doc.data()['role'] as String?;
  //   }
  // }

  static Future<void> addUser(Map<String, dynamic> user) async {
    await usersCollection.add(user);
  }

  static Future<void> updateUser(String id, Map<String, dynamic> user) async {
    await usersCollection.doc(id).update(user);
  }
}
