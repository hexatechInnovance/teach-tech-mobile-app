import 'package:equatable/equatable.dart';

class Attendance extends Equatable {
  final int? id;
  final Student? student;
  final String? date;
  final bool? status;
  final int? course;

  const Attendance({
    required this.id,
    required this.student,
    required this.date,
    required this.status,
    required this.course,
  });

  factory Attendance.fromJson(dynamic json) {
    return Attendance(
      id: json['id'],
      student:
          json['student'] != null ? Student.fromJson(json['student']) : null,
      date: json['date'],
      status: json['status'],
      course: json['course'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student': student?.toJson(),
      'date': date,
      'status': status,
      'course': course,
    };
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        student,
        date,
        status,
        course,
      ];
}

class Student extends Equatable {
  final int? id;
  final String? name;

  const Student({
    required this.id,
    required this.name,
  });

  factory Student.fromJson(dynamic json) {
    return Student(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
      ];
}
