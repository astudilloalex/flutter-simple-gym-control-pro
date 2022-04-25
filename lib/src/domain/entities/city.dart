import 'package:simple_gym_control_pro/src/domain/entities/country.dart';

class City {
  const City({
    this.id = 0,
    required this.name,
    required this.country,
  });

  final int id;
  final String name;
  final Country country;

  factory City.fromJson(final Map<String, dynamic> json) {
    return City(
      id: json['id'] as int,
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id > 0) 'id': id,
      'country': country.toJson(),
      'name': name,
    };
  }
}
