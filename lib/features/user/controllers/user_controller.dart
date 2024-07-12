import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart' as local_user;

class UserController extends ChangeNotifier {
  firebase_auth.User? _firebaseUser;
  String? _username;
  String? _role;
  String? _displayName;
  bool isFirstLogin = false;

  firebase_auth.User? get currentUser => _firebaseUser;
  String? get username => _username;
  String? get role => _role;
  String? get displayName => _displayName;

  List<String> get userList => _userList;
  List<String> _userList = [];

  Future<bool> login(String email, String password) async {
    try {
      final userCredential = await firebase_auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firebaseUser = userCredential.user;
      _username = email;

      if (password == 'Abcd1234') {
        isFirstLogin = true;
      } else {
        isFirstLogin = false;
      }

      await _fetchUserDetails();

      notifyListeners();
      return true;
    } catch (e) {
      print('Login failed: $e');
      return false;
    }
  }

  Future<bool> createUser(String email, String displayName, String role) async {
    try {
      final userCredential = await firebase_auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: 'Abcd1234',
      );

      _firebaseUser = userCredential.user;

      final newUser = local_user.User(
        username: email,
        displayName: displayName,
        role: role,
      );

      await FirebaseFirestore.instance.collection('users').doc(email).set(newUser.toFirestore());

      notifyListeners();
      return true;
    } catch (e) {
      print('Registration failed: $e');
      return false;
    }
  }

  Future<void> changePassword(String newPassword) async {
    if (_firebaseUser != null) {
      await _firebaseUser!.updatePassword(newPassword);
      notifyListeners();
    }
  }

  Future<bool> updateDisplayName(String newDisplayName) async {
    if (_firebaseUser != null) {
      try {
        await FirebaseFirestore.instance.collection('users').doc(_firebaseUser!.email!).update({
          'displayName': newDisplayName,
        });
        _displayName = newDisplayName;
        notifyListeners();
        return true;
      } catch (e) {
        print('Failed to update display name: $e');
        return false;
      }
    }
    return false;
  }

  void logout() {
    firebase_auth.FirebaseAuth.instance.signOut();
    _firebaseUser = null;
    _username = null;
    _role = null;
    _displayName = null;
    notifyListeners();
  }

  Future<void> syncUsers() async {
    final usersSnapshot = await FirebaseFirestore.instance.collection('users').get();
    final firestoreUsers = usersSnapshot.docs.map((doc) => doc.id).toList();

    final userRecord = firebase_auth.FirebaseAuth.instance.currentUser;
    final email = userRecord?.email;

    if (email != null && !firestoreUsers.contains(email)) {
      final newUser = local_user.User(
        username: email,
        displayName: userRecord?.displayName ?? '',
        role: 'worker',
      );

      await FirebaseFirestore.instance.collection('users').doc(email).set(newUser.toFirestore());
    }

    for (final doc in usersSnapshot.docs) {
      if (firebase_auth.FirebaseAuth.instance.currentUser?.email == doc.id) continue;
      await FirebaseFirestore.instance.collection('users').doc(doc.id).delete();
    }

    _userList = usersSnapshot.docs.map((doc) => doc.data()['displayName'] as String).toList();
    notifyListeners();
  }

  Future<void> _fetchUserDetails() async {
    if (_firebaseUser != null) {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(_firebaseUser!.email!).get();
      if (userDoc.exists) {
        final userData = userDoc.data()!;
        _role = userData['role'] as String;
        _displayName = userData['displayName'] as String;
      }
    }
  }
}
