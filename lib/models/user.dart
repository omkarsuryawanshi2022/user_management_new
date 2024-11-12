class User {
  final String id;
  final String username;
  final String email;

  User({required this.id, required this.username, required this.email});

  factory User.fromMap(Map<dynamic, dynamic> data) {
    return User(
      id: data['id'],
      username: data['username'],
      email: data['email'],
    );
  }
}
