import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/core/base/base_view.dart';
import 'package:teach_tech_mobile/app/core/widgets/custom_app_bar.dart';
import 'package:teach_tech_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:teach_tech_mobile/app/modules/home/widgets/course_icon_button.dart';
import 'package:teach_tech_mobile/app/routes/app_pages.dart';
import 'package:teach_tech_mobile/app/utils/text_style.dart';

class HomeView extends BaseView<HomeController> {
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
      children: [
        _getCourseCard(context),
        const SizedBox(
          height: 30,
        ),
        _getCourseActionButton(),
      ],
    );
  }

  Widget _getCourseCard(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .2,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.deepPurple[300],
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                controller.rxCourse.value.courseName,
                style: TextStyles.titleTextStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                controller.rxCourse.value.courseInstructorUiModel.userName,
                style: TextStyles.titleDescriptionTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "CLASS : ${controller.rxCourse.value.batchClass}",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                        Text(
                          "BATCH : ${controller.rxCourse.value.id}",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Student : ${controller.rxCourse.value.currentStudent}",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                        Text(
                          "Capacity : ${controller.rxCourse.value.capacity}",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "START : ${controller.rxCourse.value.startDate}",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                        Text(
                          "END : ${controller.rxCourse.value.endDate}",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "Days : ${controller.rxCourse.value.days[0]}, ${controller.rxCourse.value.days[1]}, ${controller.rxCourse.value.days[2]}",
                style: TextStyles.titleDescriptionTextStyle,
              ),
              Text(
                "Time : ${controller.rxCourse.value.batchTime}",
                style: TextStyles.titleDescriptionTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCourseActionButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CourseIconButton(
              icon: Icons.check_box_outlined,
              title: "Attendance",
              color: Colors.blue,
              backGroundColor: Colors.blue.shade200,
              onPressed: _navigateToAttendancePage,
            ),
            CourseIconButton(
              icon: Icons.payment_outlined,
              title: "Payment",
              color: Colors.deepOrange,
              backGroundColor: Colors.deepOrange.shade200,
              onPressed: _navigateToPaymentPage,
            ),
            CourseIconButton(
              icon: Icons.notifications_active_outlined,
              title: "Notice",
              color: Colors.teal,
              backGroundColor: Colors.teal.shade200,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CourseIconButton(
              icon: Icons.groups,
              title: "Students",
              color: Colors.pink,
              backGroundColor: Colors.pink.shade200,
              onPressed: _navigateToStudentPage,
            ),
          ],
        ),
      ],
    );
  }

  void _navigateToAttendancePage() {
    int courseId = 1;
    Get.toNamed(Routes.ATTENDANCE, arguments: {'courseId' : courseId});
  }

  void _navigateToStudentPage() {
    Get.toNamed(Routes.STUDENT);
  }

  void _navigateToPaymentPage() {
    Get.toNamed(Routes.PAYMENT);
  }
}
