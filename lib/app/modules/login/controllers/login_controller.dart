import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/core/base/base_controller.dart';
import 'package:teach_tech_mobile/app/log.dart';

class LoginController extends BaseController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool rememberMeIsChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login(){
    Log.debug("Pressed");
  }

  void toggleRememberMe(bool value) {
    rememberMeIsChecked(value);
  }
}
