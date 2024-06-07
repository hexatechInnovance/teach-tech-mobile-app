import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final int? id;
  final String? courseName;
  final String? courseTitle;
  final String? courseFee;
  final int? currentStudent;
  final int? capacity;
  final String? startDate;
  final String? endDate;
  final CourseInstructor? courseInstructor;
  final List<String> days;
  final String? batchTime;
  final String? batchClass;

  const Course({
    required this.id,
    required this.courseName,
    required this.courseTitle,
    required this.courseFee,
    required this.currentStudent,
    required this.capacity,
    required this.startDate,
    required this.endDate,
    required this.courseInstructor,
    required this.days,
    required this.batchTime,
    required this.batchClass,
  });

  factory Course.fromJson(dynamic json) {
    return Course(
      id: json['id'],
      courseName: json['course_name'],
      courseTitle: json['course_title'],
      courseFee: json['course_fee'],
      currentStudent: json['current_student'],
      capacity: json['capacity'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      courseInstructor: CourseInstructor.fromJson(json['course_instructor']),
      batchTime: json['batch_time'],
      days: List<String>.from(json['days']),
      batchClass: json['batch_class'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_name': courseName,
      'course_title': courseTitle,
      'course_fee': courseFee,
      'current_student': currentStudent,
      'capacity': capacity,
      'start_date': startDate,
      'end_date': endDate,
      'course_instructor': courseInstructor?.toJson(),
      'days': days,
      'batch_time': batchTime,
      'batch_class': batchClass,
    };
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        courseName,
        courseTitle,
        courseFee,
        currentStudent,
        capacity,
        startDate,
        endDate,
        courseInstructor,
        days,
        batchTime,
        batchClass,
      ];
}

class CourseInstructor extends Equatable {
  final int? id;
  final String? userName;

  const CourseInstructor({
    required this.id,
    required this.userName,
  });

  factory CourseInstructor.fromJson(json) {
    return CourseInstructor(
      id: json['id'],
      userName: json['user_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
    };
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        userName,
      ];
}
