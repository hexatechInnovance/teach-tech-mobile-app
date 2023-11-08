import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teach_tech_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:teach_tech_mobile/app/utils/app_text.dart';
import 'package:teach_tech_mobile/app/utils/custom_border_decoration.dart';
import 'package:teach_tech_mobile/app/utils/custom_empty_size_box.dart';
import 'package:teach_tech_mobile/app/utils/size_helper.dart';
import 'package:teach_tech_mobile/app/utils/text_style.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      padding: const EdgeInsets.all(SizeHelper.dimen_10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(SizeHelper.dimen_20),
            child: Text(
              AppText.welcome,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Email Text Field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.email,
                style: TextStyles.labelTextStyle,
              ),
              CustomEmptySizeBox.emptySizeBox_10,
              Container(
                decoration: BoxDecoration(
                  color: CustomBorderDecoration.containerColorGrey,
                  borderRadius: CustomBorderDecoration.borderRadius_10,
                ),
                child: TextFormField(
                  controller: controller.emailController.value,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: SizeHelper.dimen_10,
                      right: SizeHelper.dimen_10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          CustomEmptySizeBox.emptySizeBox_30,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.password,
                style: TextStyles.labelTextStyle,
              ),
              CustomEmptySizeBox.emptySizeBox_10,
              Container(
                decoration: BoxDecoration(
                  color: CustomBorderDecoration.containerColorGrey,
                  borderRadius: CustomBorderDecoration.borderRadius_10,
                ),
                child: TextFormField(
                  obscureText: true,
                  controller: controller.passwordController.value,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: SizeHelper.dimen_10,
                      right: SizeHelper.dimen_10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          CustomEmptySizeBox.emptySizeBox_10,
          // Login Button

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      activeColor: CustomBorderDecoration.containerColorBlue,
                      value: controller.rememberMeIsChecked.value,
                      onChanged: (bool? value) {
                        controller.toggleRememberMe(value!);
                      },
                    ),
                  ),
                  const Text(
                    AppText.rememberMe,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1))),
                child: const Text(
                  AppText.forgotPassword,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          CustomEmptySizeBox.emptySizeBox_30,

          GestureDetector(
            onTap: () {
              controller.login();
            },
            child: Container(
              width: double.infinity,
              height: SizeHelper.dimen_50,
              decoration: BoxDecoration(
                borderRadius: CustomBorderDecoration.borderRadius_10,
                color: CustomBorderDecoration.containerColorBlue,
              ),
              child: const Center(
                  child: Text(
                AppText.login,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )),
            ),
          ),
          CustomEmptySizeBox.emptySizeBox_10,
          Container(
            width: double.infinity,
            height: SizeHelper.dimen_50,
            decoration: BoxDecoration(
              borderRadius: CustomBorderDecoration.borderRadius_10,
              color: CustomBorderDecoration.containerColorGrey,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/icons_google.svg", height: 30,width: 30,),
                SizedBox(width: 5,),
                Text("Sign-in with google", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
