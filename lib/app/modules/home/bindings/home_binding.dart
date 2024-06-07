import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/data/data_source/course/course_data_src.dart';
import 'package:teach_tech_mobile/app/data/data_source/course/course_data_src_impl.dart';
import 'package:teach_tech_mobile/app/data/repository/course/course_repository.dart';
import 'package:teach_tech_mobile/app/data/repository/course/course_repository_impl.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseDataSrc>(
      () => CourseDataSrcImpl(),
    );
    Get.lazyPut<CourseRepository>(
      () => CourseRepositoryImpl(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
