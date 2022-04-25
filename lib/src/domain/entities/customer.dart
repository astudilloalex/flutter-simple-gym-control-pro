import 'package:simple_gym_control_pro/src/domain/entities/membership.dart';
import 'package:simple_gym_control_pro/src/domain/entities/user.dart';
import 'package:simple_gym_control_pro/src/domain/enums/duration_type.dart';
import 'package:simple_gym_control_pro/src/domain/enums/gender.dart';

class Customer {
  const Customer({
    this.id = 0,
    this.idCard,
    required this.firstName,
    required this.lastName,
    this.birthdate,
    this.gender,
    this.email,
    this.phoneNumber,
    required this.joiningDate,
    required this.startDate,
    required this.membership,
    this.user,
  });

  final int id;
  final String? idCard;
  final String firstName;
  final String lastName;
  final Gender? gender;
  final DateTime? birthdate;
  final String? email;
  final String? phoneNumber;
  final DateTime joiningDate;
  final DateTime startDate;
  final Membership membership;
  final User? user;

  factory Customer.fromJson(final Map<String, dynamic> json) {
    final String? gender = json['gender'] as String?;
    return Customer(
      id: json['id'] as int,
      idCard: json['idCard'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: gender == 'M' ? Gender.male : Gender.female,
      birthdate: DateTime.tryParse(json['birthdate'].toString()),
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      joiningDate: DateTime.parse(json['joiningDate'].toString()),
      startDate: DateTime.parse(json['startDate'].toString()),
      membership: Membership.fromJson(
        json['membership'] as Map<String, dynamic>,
      ),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id > 0) 'id': id,
      'idCard': idCard,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender == Gender.male ? 'M' : 'F',
      'birthdate': birthdate,
      'email': email,
      'phoneNumber': phoneNumber,
      'joiningDate': joiningDate,
      'startDate': startDate,
      'membership': membership.toJson(),
      'user': user?.toJson(),
    };
  }

  int? get age {
    if (birthdate == null) return null;
    final DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthdate!.year;
    final int birthMonth = birthdate!.month;
    final int currentMonth = currentDate.month;
    if (birthMonth > currentMonth) {
      age--;
    } else if (birthMonth == currentMonth) {
      final int currentDay = currentDate.day;
      final int birthDay = birthdate!.day;
      if (birthDay > currentDay) age--;
    }
    return age;
  }

  DateTime get endDate {
    if (membership.durationType == DurationType.days) {
      return startDate.add(Duration(days: membership.duration));
    } else if (membership.durationType == DurationType.months) {
      return DateTime(
        startDate.year,
        startDate.month + membership.duration,
        startDate.day,
      );
    }
    return DateTime(
      startDate.year + membership.duration,
      startDate.month,
      startDate.day,
    );
  }
}
