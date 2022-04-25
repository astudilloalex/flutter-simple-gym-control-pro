import 'package:simple_gym_control_pro/src/domain/entities/city.dart';

class Location {
  const Location({
    this.id = 0,
    required this.streetAddress,
    this.postalCode,
    required this.city,
  });

  final int id;
  final String streetAddress;
  final String? postalCode;
  final City city;

  factory Location.fromJson(final Map<String, dynamic> json) {
    return Location(
      id: json['id'] as int,
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      postalCode: json['postalCode'] as String?,
      streetAddress: json['streetAddress'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id > 0) 'id': id,
      'city': city.toJson(),
      'postalCode': postalCode,
      'streetAddress': streetAddress,
    };
  }
}
