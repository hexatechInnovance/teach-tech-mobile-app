import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/log.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

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
}
