import 'package:simple_gym_control_pro/src/domain/entities/department.dart';
import 'package:simple_gym_control_pro/src/domain/entities/job.dart';
import 'package:simple_gym_control_pro/src/domain/entities/user.dart';
import 'package:simple_gym_control_pro/src/domain/enums/gender.dart';

class Employee {
  const Employee({
    this.id = 0,
    this.idCard,
    required this.firstName,
    required this.lastName,
    this.gender,
    this.birthdate,
    this.email,
    this.phoneNumber,
    required this.hireDate,
    required this.salary,
    required this.job,
    required this.department,
    this.user,
    this.manager,
  });

  final int id;
  final String? idCard;
  final String firstName;
  final String lastName;
  final Gender? gender;
  final DateTime? birthdate;
  final String? email;
  final String? phoneNumber;
  final DateTime hireDate;
  final double salary;
  final Job job;
  final Department department;
  final User? user;
  final Employee? manager;

  factory Employee.fromJson(final Map<String, dynamic> json) {
    final String? gender = json['gender'] as String?;
    return Employee(
      id: json['id'] as int,
      idCard: json['idCard'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: gender == 'M' ? Gender.male : Gender.female,
      birthdate: DateTime.tryParse(json['birthdate'].toString()),
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      hireDate: DateTime.parse(json['hireDate'].toString()),
      salary: double.parse(json['salary'].toString()),
      job: Job.fromJson(json['job'] as Map<String, dynamic>),
      department: Department.fromJson(
        json['department'] as Map<String, dynamic>,
      ),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      manager: json['manager'] == null
          ? null
          : Employee.fromJson(json['manager'] as Map<String, dynamic>),
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
      'hireDate': hireDate,
      'salary': salary,
      'job': job.toJson(),
      'department': department.toJson(),
      'manager': manager?.toJson(),
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
}
