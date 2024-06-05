import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/core/base/base_controller.dart';
import 'package:teach_tech_mobile/app/data/model/request/attendance_request.dart';
import 'package:teach_tech_mobile/app/data/model/response/attendance_response.dart';
import 'package:teach_tech_mobile/app/data/repository/attendance/attendance_repository.dart';
import 'package:teach_tech_mobile/app/modules/attendance/ui_model/attendance_ui_model.dart';

class AttendanceController extends BaseController {
  final AttendanceRepository _attendanceRepository = Get.find();
  final RxList<AttendanceUiModel> attendanceList =
      RxList<AttendanceUiModel>(List.empty(growable: true));

  late final int courseId;

  @override
  void onInit() {
    super.onInit();
    courseId = Get.arguments['courseId'];
    _getAttendanceList();
  }

  void _getAttendanceList() async {
    _attendanceRepository.getAttendanceList(courseId: courseId).then(
      (AttendanceResponse attendanceResponse) {
        attendanceList.value = attendanceResponse.getListOfAttendanceUiModel();
      },
    );
  }

  void toggleCheckedItem(AttendanceUiModel model) {
    model.status.value = !model.status.value;
  }

  void submitAttendance() async {
    List<AttendanceRequest> updatedAttendanceList = [];
    for (int i = 0; i < attendanceList.length; i++) {
      updatedAttendanceList.add(AttendanceRequest(
          id: attendanceList[i].id, status: attendanceList[i].status.value));
    }

    _attendanceRepository
        .updateAttendance(courseId: courseId, attendanceList: updatedAttendanceList)
        .then((bool value) {
      _getAttendanceList();
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
