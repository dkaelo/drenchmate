class User {
  final String username;
  final String role;
  final String displayName;

  User({
    required this.username,
    required this.role,
    required this.displayName,
  });

  factory User.fromFirestore(Map<String, dynamic> data) {
    return User(
      username: data['username'],
      role: data['role'],
      displayName: data['displayName'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'username': username,
      'role': role,
      'displayName': displayName,
    };
  }
}
