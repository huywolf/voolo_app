import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';
import 'package:voolo_app/shared/widgets/input/default_textfield.dart';

import '../controller/auth_controller.dart';
import 'widgets/blurry_container.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF3F3F3),
          body: SingleChildScrollView(
            child: SizedBox(
              height: SizeConfig().screenHeight,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const BlurryContainer(),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                      child: const SizedBox(),
                    ),
                  ),
                  _buildMainContent(context),
                  Positioned(
                    bottom: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${'do_not_have_an_account'.tr}?  ",
                          style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () => controller.switchView(1),
                          child: Text(
                            "sign_up".tr,
                            style: const TextStyle(
                              color: ColorConstants.BLUE_LINK,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Text(
          "sign_in".tr,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28, fontFamily: "Roboto"),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => controller.loginErrorText.value != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          controller.loginErrorText.value!,
                          style: const TextStyle(color: ColorConstants.RED_ERROR, fontSize: 14),
                        ),
                      )
                    : const SizedBox()),
                DefaultTextField(
                  controller: controller.loginPhoneEmailController,
                  labelText: "phone_number_email".tr,
                  validator: ValidateUtil().validatePhoneNumberOrEmail,
                ),
                const SizedBox(height: 20),
                DefaultTextField(
                  controller: controller.loginPasswordController,
                  labelText: "password".tr,
                  obscureText: true,
                  validator: ValidateUtil().validatePassword,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${'forgot_password'.tr}?",
                      style: const TextStyle(color: Color(0xff197DDE), fontSize: 13, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(height: 60),
                AppElevatedButton(
                  onPressed: () async {
                    controller.login(context);
                  },
                  buttonHeight: Dimension.K_BUTTON_HEIGHT,
                  radius: 30,
                  text: "sign_in".tr,
                  buttonBgColor: Colors.black,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        )
      ],
    );
  }
}
