import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/core/base/base_controller.dart';
import 'package:teach_tech_mobile/app/data/model/response/attendance_response.dart';
import 'package:teach_tech_mobile/app/data/repository/attendance/attendance_repository.dart';
import 'package:teach_tech_mobile/app/modules/attendance/ui_model/attendance_ui_model.dart';

class AttendanceController extends BaseController {
  final AttendanceRepository _attendanceRepository = Get.find();
  final RxList<AttendanceUiModel> attendanceList =
      RxList<AttendanceUiModel>(List.empty(growable: true));

  @override
  void onInit() {
    super.onInit();
    _getAttendanceList();
  }

  void _getAttendanceList() async {
    int courseId = 1;
    _attendanceRepository.getAttendanceList(courseId: courseId).then(
      (AttendanceResponse attendanceResponse) {
        attendanceList.value = attendanceResponse.getListOfAttendanceUiModel();
      },
    );
  }

  void toggleCheckedItem(AttendanceUiModel model) {
    model.status.value = !model.status.value;
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
