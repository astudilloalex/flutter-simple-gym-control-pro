import 'package:simple_gym_control_pro/src/domain/entities/role.dart';

class User {
  const User({
    this.id = 0,
    required this.username,
    required this.password,
    required this.role,
  });

  final int id;
  final String username;
  final String password;
  final Role role;

  factory User.fromJson(final Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      role: Role.fromJson(json['role'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id > 0) 'id': id,
      'username': username,
      'password': password,
      'role': role.toJson(),
    };
  }
}
