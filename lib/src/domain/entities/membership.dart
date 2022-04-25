import 'package:simple_gym_control_pro/src/domain/enums/duration_type.dart';

class Membership {
  const Membership({
    this.id = 0,
    required this.name,
    this.description,
    required this.price,
    required this.duration,
    required this.durationType,
  });

  final int id;
  final String name;
  final String? description;
  final double price;
  final int duration;
  final DurationType durationType;

  factory Membership.fromJson(final Map<String, dynamic> json) {
    final String duraType = json['durationType'] as String;
    return Membership(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: double.parse(json['price'].toString()),
      duration: json['duration'] as int,
      durationType: duraType == 'D'
          ? DurationType.days
          : duraType == 'M'
              ? DurationType.months
              : DurationType.years,
    );
  }

  Map<String, dynamic> toJson() {
    final String duraType = durationType == DurationType.days
        ? 'D'
        : durationType == DurationType.months
            ? 'M'
            : 'Y';
    return {
      if (id > 0) 'id': id,
      'name': name,
      'description': description,
      'price': price,
      'duration': duration,
      'durationType': duraType,
    };
  }
}
