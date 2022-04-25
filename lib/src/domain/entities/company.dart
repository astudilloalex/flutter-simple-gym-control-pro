import 'dart:typed_data';

class Company {
  const Company({
    this.id = 0,
    required this.name,
    this.address,
    this.phone,
    this.iconURL,
    this.iconMemory,
  });

  final int id;
  final String name;
  final String? phone;
  final String? address;
  final String? iconURL;
  final Uint8List? iconMemory;

  factory Company.fromJson(final Map<String, dynamic> json) {
    return Company(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      iconURL: json['icon'] as String?,
      iconMemory: json['icon'] as Uint8List?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id > 0) 'id': id,
      'name': name,
      'phone': phone,
      'address': address,
      if (iconURL != null) 'icon': iconURL,
      if (iconMemory != null) 'icon': iconMemory,
    };
  }
}
