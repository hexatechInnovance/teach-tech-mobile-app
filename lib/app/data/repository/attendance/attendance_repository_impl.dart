import 'package:teach_tech_mobile/app/data/data_source/attendance/attendance_data_source.dart';
import 'package:teach_tech_mobile/app/data/model/request/attendance_list_request.dart';
import 'package:teach_tech_mobile/app/data/model/response/attendance_response.dart';
import 'package:teach_tech_mobile/app/data/repository/attendance/attendance_repository.dart';
import 'package:get/get.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceDataSource _attendanceDataSource = Get.find();

  @override
  Future<AttendanceResponse> getAttendanceList({required int courseId}) async {
    return _attendanceDataSource.getAttendanceList(courseId: courseId);
  }

  @override
  Future<bool> updateAttendance(
      {required int courseId, required attendanceList}) {
    final AttendanceListRequest attendanceListRequest = AttendanceListRequest(attendanceRequestList: attendanceList);
    final requestBody =  attendanceListRequest.toJson();
    return _attendanceDataSource.updateAttendanceList(
        courseId: courseId, requestBody: requestBody);
  }
}
