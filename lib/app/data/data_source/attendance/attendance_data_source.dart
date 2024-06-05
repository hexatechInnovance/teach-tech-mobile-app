import 'package:teach_tech_mobile/app/data/model/response/attendance_response.dart';

abstract class AttendanceDataSource {
  Future<AttendanceResponse> getAttendanceList({
    required int courseId,
  });

  Future<bool> updateAttendanceList({
    required int courseId,
    required dynamic requestBody,
  });
}
