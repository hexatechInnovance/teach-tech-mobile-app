import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/data/data_source/course/course_data_src.dart';
import 'package:teach_tech_mobile/app/data/model/response/course/course.dart';
import 'package:teach_tech_mobile/app/data/repository/course/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseDataSrc _courseDataSrc = Get.find();

  @override
  Future<Course> getCourse({required courseId}) async {
    return _courseDataSrc.getCourse(courseId: courseId);
  }
}
