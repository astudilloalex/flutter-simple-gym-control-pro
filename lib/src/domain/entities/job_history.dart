import 'package:simple_gym_control_pro/src/domain/entities/department.dart';
import 'package:simple_gym_control_pro/src/domain/entities/employee.dart';
import 'package:simple_gym_control_pro/src/domain/entities/job.dart';

class JobHistory {
  const JobHistory({
    this.id = 0,
    required this.startDate,
    required this.endDate,
    required this.department,
    required this.employee,
    required this.job,
  });

  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final Department department;
  final Employee employee;
  final Job job;

  factory JobHistory.fromJson(final Map<String, dynamic> json) {
    return JobHistory(
      id: json['id'] as int,
      startDate: DateTime.parse(json['startDate'].toString()),
      endDate: DateTime.parse(json['endDate'].toString()),
      department: Department.fromJson(
        json['department'] as Map<String, dynamic>,
      ),
      employee: Employee.fromJson(json['employee'] as Map<String, dynamic>),
      job: Job.fromJson(json['job'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id > 0) 'id': id,
      'startDate': startDate,
      'endDate': endDate,
      'department': department.toJson(),
      'employee': employee.toJson(),
      'job': job.toJson(),
    };
  }
}
