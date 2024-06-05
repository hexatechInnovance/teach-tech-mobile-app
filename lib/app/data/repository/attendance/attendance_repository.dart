import 'package:teach_tech_mobile/app/data/model/response/attendance_response.dart';

abstract class AttendanceRepository {
  Future<AttendanceResponse> getAttendanceList({
    required int courseId,
  });

  Future<bool> updateAttendance({
    required int courseId,
    required attendanceList,
  });
}
