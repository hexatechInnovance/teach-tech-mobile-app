import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> rePasswordController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

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

  void signUp() {

  }
}
