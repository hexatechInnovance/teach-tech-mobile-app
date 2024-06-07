import 'package:dio/dio.dart';
import 'package:teach_tech_mobile/app/core/constants/endpoint.dart';
import 'package:teach_tech_mobile/app/core/remote/base_remote_source.dart';
import 'package:teach_tech_mobile/app/data/data_source/course/course_data_src.dart';
import 'package:teach_tech_mobile/app/data/model/response/course/course.dart';

class CourseDataSrcImpl extends BaseRemoteSource implements CourseDataSrc {
  @override
  Future<Course> getCourse({required int courseId}) async {
    Future<Response<dynamic>> response =
        plainDio.get("${Endpoint.course}/$courseId/");

    return callApiWithErrorParser(
      () => response,
    ).then((Response<dynamic> response) {
      return Course.fromJson(response.data);
    }).catchError((dynamic exception, StackTrace stackTrace) async {
      return Future<Course>.error(exception, stackTrace);
    });
  }
}
