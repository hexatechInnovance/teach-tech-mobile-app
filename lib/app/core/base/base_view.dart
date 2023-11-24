import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:teach_tech_mobile/app/core/base/base_controller.dart';
import 'package:teach_tech_mobile/app/core/model/page_state.dart';
import 'package:teach_tech_mobile/app/core/model/snack_bar_message.dart';
import 'package:teach_tech_mobile/app/core/values/app_colors.dart';
import 'package:teach_tech_mobile/app/core/widgets/loading.dart';
import 'package:teach_tech_mobile/falvors/build_config.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  final Logger logger = BuildConfig.instance.envConfig.logger;

  Widget body(BuildContext context);

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  PreferredSizeWidget? appBar(BuildContext context);

  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          Obx(() => controller.pageState == PageState.LOADING
              ? _showLoading()
              : Container()),
          Obx(() => controller.snackBarMessage.isNotEmpty()
              ? showSnackBar(controller.snackBarMessage)
              : Container()),
          Container(),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget _showLoading() {
    return const Loading();
  }

  Color statusBarColor() {
    return AppColors.pageBackground;
  }

  Widget showSnackBar(SnackBarMessage snackBarMessage) {
    final snackBar = SnackBar(
      content: Text(
        snackBarMessage.message ?? "",
        style: const TextStyle(
          color: AppColors.textColorPrimary,
          fontSize: 16,
        ),
      ),
      backgroundColor: snackBarMessage.backgroundColor,
      duration: const Duration(seconds: 1),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return Container();
  }
}
