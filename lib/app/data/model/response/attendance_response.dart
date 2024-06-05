import 'package:equatable/equatable.dart';
import 'package:teach_tech_mobile/app/data/model/response/attendance.dart';
import 'package:teach_tech_mobile/app/modules/attendance/ui_model/attendance_ui_model.dart';

class AttendanceResponse extends Equatable {
  final List<Attendance> attendanceList;

  const AttendanceResponse({
    required this.attendanceList,
  });

  factory AttendanceResponse.fromJson(dynamic json) {
    List<Attendance> list = List<Attendance>.empty(growable: true);

    if (json != null) {
      json.forEach((dynamic v) {
        list.add(Attendance.fromJson(v));
      });
    }

    return AttendanceResponse(attendanceList: list);
  }

  List<AttendanceUiModel> getListOfAttendanceUiModel() {
    List<AttendanceUiModel> list = <AttendanceUiModel>[];
    for(Attendance attendance in attendanceList) {
      list.add(AttendanceUiModel.fromAttendance(attendance));
    }

    return list;
  }

  @override
  List<Object?> get props => <Object?>[
        attendanceList,
      ];
}
