class Job {
  const Job({
    this.id = 0,
    required this.title,
    required this.minSalary,
    required this.maxSalary,
  });

  final int id;
  final String title;
  final double minSalary;
  final double maxSalary;

  factory Job.fromJson(final Map<String, dynamic> json) {
    return Job(
      id: json['id'] as int,
      title: json['title'] as String,
      minSalary: json['minSalary'] as double,
      maxSalary: json['maxSalary'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id > 0) 'id': id,
      'title': title,
      'minSalary': minSalary,
      'maxSalary': maxSalary,
    };
  }
}
