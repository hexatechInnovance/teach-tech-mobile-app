import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teach_tech_mobile/app/core/base/base_controller.dart';
import 'package:teach_tech_mobile/app/data/model/response/course/course.dart';
import 'package:teach_tech_mobile/app/data/repository/course/course_repository.dart';
import 'package:teach_tech_mobile/app/log.dart';
import 'package:teach_tech_mobile/app/modules/home/ui_model/course_ui_model.dart';

class HomeController extends BaseController {
  late final CourseRepository _courseRepository;
  Rx<CourseUiModel> rxCourse = const CourseUiModel(
    id: 0,
    courseName: '',
    courseTitle: '',
    courseFee: "",
    currentStudent: 0,
    capacity: 0,
    startDate: '',
    endDate: '',
    batchTime: '',
    days: ['sat', 'sun', 'mon'],
    courseInstructorUiModel: CourseInstructorUiModel(id: 0, userName: ''),
    batchClass: 'X',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    _courseRepository = Get.find();
    _getCourse(1);
  }

  void _getCourse(int courseId) async {
    _courseRepository.getCourse(courseId: courseId).then((Course course) {
      rxCourse.value = CourseUiModel.fromCourse(course);
      Log.debug("name : ${rxCourse.value.courseName}");
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
