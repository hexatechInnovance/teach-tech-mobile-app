import 'package:equatable/equatable.dart';
import 'package:teach_tech_mobile/app/data/model/response/course/course.dart';

class CourseUiModel extends Equatable {
  final int id;
  final String courseName;
  final String courseTitle;
  final String courseFee;
  final int currentStudent;
  final int capacity;
  final String startDate;
  final String endDate;
  final CourseInstructorUiModel courseInstructorUiModel;
  final List<String> days;
  final String batchTime;
  final String batchClass;

  const CourseUiModel({
    required this.id,
    required this.courseName,
    required this.courseTitle,
    required this.courseFee,
    required this.currentStudent,
    required this.capacity,
    required this.startDate,
    required this.endDate,
    required this.courseInstructorUiModel,
    required this.days,
    required this.batchTime,
    required this.batchClass,
  });

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
        courseInstructorUiModel,
        days,
        batchTime,
        batchClass,
      ];

  factory CourseUiModel.fromCourse(Course model) {
    return CourseUiModel(
      id: model.id!,
      courseName: model.courseName!,
      courseTitle: model.courseTitle!,
      courseFee: model.courseFee!,
      currentStudent: model.currentStudent!,
      capacity: model.capacity!,
      startDate: model.startDate!,
      endDate: model.endDate!,
      batchTime: model.batchTime!,
      days: model.days,
      courseInstructorUiModel:
          CourseInstructorUiModel.fromCourseInstructor(model.courseInstructor!),
      batchClass: model.batchClass!,
    );
  }
}

class CourseInstructorUiModel extends Equatable {
  final int id;
  final String userName;

  const CourseInstructorUiModel({
    required this.id,
    required this.userName,
  });

  factory CourseInstructorUiModel.fromCourseInstructor(CourseInstructor model) {
    return CourseInstructorUiModel(
      id: model.id!,
      userName: model.userName!,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        userName,
      ];
}
