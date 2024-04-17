import 'package:dio/dio.dart';
import 'package:teach_tech_mobile/app/core/constants/endpoint.dart';
import 'package:teach_tech_mobile/app/core/remote/base_remote_source.dart';
import 'package:teach_tech_mobile/app/data/data_source/attendance/attendance_data_source.dart';
import 'package:teach_tech_mobile/app/data/model/response/attendance_response.dart';

class AttendanceDataSourceImpl extends BaseRemoteSource
    implements AttendanceDataSource {
  @override
  Future<AttendanceResponse> getAttendanceList({
    required int courseId,
  }) async {
    Future<Response<dynamic>> response = plainDio.get(Endpoint.attendanceList);

    return callApiWithErrorParser(
      () => response,
    ).then((Response<dynamic> response) {
      return AttendanceResponse.fromJson(response.data);
    }).catchError((dynamic exception, StackTrace stackTrace) async {
      return Future<AttendanceResponse>.error(exception, stackTrace);
    });
  }
}
