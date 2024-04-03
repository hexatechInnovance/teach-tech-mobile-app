import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/core/base/base_view.dart';
import 'package:teach_tech_mobile/app/core/widgets/custom_app_bar.dart';
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
        _getAttendanceUploadButton(),
      ],
    );
  }

  Widget _attendanceCard(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .7,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.deepPurple[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return _getAttendanceItem(
                  "1001",
                  "ABCDEFGSD S SDSDS",
                );
              }),
        ),
      ),
    );
  }

  Widget _getAttendanceItem(String id, String name) {
    return AttendanceItem(
        id: id, name: name, isChecked: true, onChanged: (bool? val) {});
  }

  Widget _getAttendanceUploadButton() {
    return ElevatedButton(
      onPressed: null,
      child: Text(
        "Submit",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
