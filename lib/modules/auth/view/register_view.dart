import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';
import 'package:voolo_app/shared/widgets/input/default_textfield.dart';

import '../controller/auth_controller.dart';
import 'widgets/blurry_container.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              const BlurryContainer(),
              Positioned(
                top: -40,
                right: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                  child: const SizedBox(),
                ),
              ),
              _buildForm(context),
              Positioned(
                bottom: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${"already_have_an_account".tr}?  ",
                      style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () => controller.switchView(0),
                      child: Text(
                        "sign_in".tr,
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
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
      child: SizedBox(
        height: SizeConfig().screenHeight,
        child: Column(
          children: [
            const SizedBox(height: 100),
            Text(
              "sign_up".tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28, fontFamily: "Roboto"),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: [
                  DefaultTextField(
                    controller: controller.registerFullNameController,
                    labelText: "full_name".tr,
                    validator: ValidateUtil().validateFullName,
                  ),
                  const SizedBox(height: 20),
                  Obx(() => DefaultTextField(
                        controller: controller.registerPhoneNumberController,
                        labelText: "phone_number".tr,
                        validator: ValidateUtil().validatePhoneNumber,
                        errorText: controller.phoneErrorText.value,
                      )),
                  const SizedBox(height: 20),
                  Obx(() => DefaultTextField(
                        controller: controller.registerEmailController,
                        labelText: "email".tr,
                        validator: ValidateUtil().validateEmail,
                        errorText: controller.emailErrorText.value,
                      )),
                  const SizedBox(height: 60),
                  AppElevatedButton(
                    onPressed: () => controller.register(context),
                    buttonHeight: Dimension.K_BUTTON_HEIGHT,
                    radius: 30,
                    text: "sign_up".tr,
                    buttonBgColor: Colors.black,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
