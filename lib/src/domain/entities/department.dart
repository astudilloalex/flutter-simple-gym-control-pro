import 'package:simple_gym_control_pro/src/domain/entities/employee.dart';
import 'package:simple_gym_control_pro/src/domain/entities/location.dart';

class Department {
  const Department({
    this.id = 0,
    required this.name,
    required this.location,
    this.manager,
  });

  final int id;
  final String name;
  final Location location;
  final Employee? manager;

  factory Department.fromJson(final Map<String, dynamic> json) {
    return Department(
      id: json['id'] as int,
      name: json['name'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      manager: json['manager'] == null
          ? null
          : Employee.fromJson(json['manager'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id > 0) 'id': id,
      'name': name,
      'location': location.toJson(),
      'manager': manager?.toJson(),
    };
  }
}
