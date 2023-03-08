import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
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
        decoration: const BoxDecoration(color: ColorConstants.LIGHT_GREY_SCAFFOLD_BACKGROUND),
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
        height: Get.height,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => controller.registerErrorText.value != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            controller.registerErrorText.value!,
                            style: const TextStyle(fontSize: AppTextStyles.SMALL_FS, color: ColorConstants.RED_ERROR),
                          ),
                        )
                      : const SizedBox()),
                  DefaultTextField(
                    controller: controller.registerFullNameController,
                    labelText: "full_name".tr,
                    validator: ValidateUtil().validateFullName,
                  ),
                  const SizedBox(height: 20),
                  DefaultTextField(
                    controller: controller.registerPhoneNumberController,
                    labelText: "phone_number".tr,
                    validator: ValidateUtil().validatePhoneNumber,
                  ),
                  const SizedBox(height: 20),
                  DefaultTextField(
                    controller: controller.registerEmailController,
                    labelText: "email".tr,
                    validator: ValidateUtil().validateEmail,
                  ),
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
