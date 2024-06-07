import 'package:teach_tech_mobile/app/data/model/response/course/course.dart';

abstract class CourseDataSrc {
  Future<Course> getCourse({required int courseId});
}
