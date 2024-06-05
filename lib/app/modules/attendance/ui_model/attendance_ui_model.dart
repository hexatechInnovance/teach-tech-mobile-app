import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/data/model/response/attendance.dart';

class AttendanceUiModel extends Equatable {
  final int id;
  final Student student;
  final String date;
  final RxBool status;
  final int courseId;

  AttendanceUiModel({
    required this.id,
    required this.student,
    required this.date,
    required bool status,
    required this.courseId,
  }) : status = RxBool(status);

  factory AttendanceUiModel.fromAttendance(Attendance model) {
    return AttendanceUiModel(
      id: model.id!,
      student: model.student!,
      date: model.date!,
      status: model.status!,
      courseId: model.course!,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        student,
        date,
        status,
        courseId,
      ];
}
