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
                "COURSE NAME",
                style: TextStyles.titleTextStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "INSTRUCTOR NAME",
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
                          "CLASS : X",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                        Text(
                          "BATCH : 2",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Student : 100",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                        Text(
                          "Capacity : 100",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "START : 20/03/20224",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                        Text(
                          "END : 20/03/2024",
                          style: TextStyles.titleDescriptionTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "Days : Saturday, Sunday, Monday",
                style: TextStyles.titleDescriptionTextStyle,
              ),
              Text(
                "Time : 03:00 PM",
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
    Get.toNamed(Routes.ATTENDANCE);
  }

  void _navigateToStudentPage() {
    Get.toNamed(Routes.STUDENT);
  }

  void _navigateToPaymentPage() {
    Get.toNamed(Routes.PAYMENT);
  }
}
