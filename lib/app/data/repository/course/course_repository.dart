import 'package:teach_tech_mobile/app/data/model/response/course/course.dart';

abstract class CourseRepository {
  Future<Course> getCourse({required courseId});
}
