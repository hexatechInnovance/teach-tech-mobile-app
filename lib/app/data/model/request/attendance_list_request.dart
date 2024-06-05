import 'package:equatable/equatable.dart';
import 'package:teach_tech_mobile/app/data/model/request/attendance_request.dart';

class AttendanceListRequest extends Equatable {
  final List<AttendanceRequest> attendanceRequestList;

  const AttendanceListRequest({
    required this.attendanceRequestList,
  });

  List<Map<String, dynamic>> toJson() {
    return attendanceRequestList
        .map((AttendanceRequest request) => request.toJson())
        .toList();
  }

  @override
  List<Object?> get props => <Object>[
        attendanceRequestList,
      ];
}
