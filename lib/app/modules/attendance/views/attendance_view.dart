import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/core/base/base_view.dart';
import 'package:teach_tech_mobile/app/core/widgets/custom_app_bar.dart';
import 'package:teach_tech_mobile/app/core/widgets/extended_outline_button.dart';
import 'package:teach_tech_mobile/app/log.dart';
import 'package:teach_tech_mobile/app/modules/attendance/ui_model/attendance_ui_model.dart';
import 'package:teach_tech_mobile/app/modules/attendance/widgets/attendance_item.dart';
import 'package:teach_tech_mobile/app/utils/text_style.dart';

import '../controllers/attendance_controller.dart';

class AttendanceView extends BaseView<AttendanceController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar();
  }

  @override
  Widget body(BuildContext context) {
    return _getPageBody(context);
  }

  Widget _getPageBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Attendance",
          style: TextStyles.attendanceTitleStyle,
        ),
        _attendanceCard(context),
        const SizedBox(
          height: 20,
        ),
        _getAttendanceUploadButton(),
      ],
    );
  }

  Widget _attendanceCard(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .7,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        color: Colors.deepPurple[300],
        child: Obx(() => ListView.builder(
            itemCount: controller.attendanceList.length,
            itemBuilder: (BuildContext context, int index) {
              AttendanceUiModel attendanceUiModel =
                  controller.attendanceList[index];
              return _getAttendanceItem(model: attendanceUiModel);
            })),
      ),
    );
  }

  Widget _getAttendanceItem({required AttendanceUiModel model}) {
    return Obx(() => AttendanceItem(
          id: model.student.id.toString(),
          name: model.student.name!,
          isChecked: model.status.value,
          onChanged: (bool? isChecked) {
            controller.toggleCheckedItem(model);
          },
        ));
  }

  Widget _getAttendanceUploadButton() {
    return ExtendedOutlinedButton(
      onPressed: _onPressedSubmit,
      text: 'Submit',
      color: Colors.deepPurple,
    );
  }

  void _onPressedSubmit() {
    Log.debug("Pressed");
  }
}
