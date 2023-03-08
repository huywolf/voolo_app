import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/modules/auth/view/widgets/blurry_container.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';
import 'package:voolo_app/shared/widgets/input/default_textfield.dart';

import '../controller/create_password_controller.dart';

class CreatePasswordScreen extends GetView<CreatePasswordController> {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        decoration: const BoxDecoration(color: ColorConstants.LIGHT_GREY_SCAFFOLD_BACKGROUND),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const BlurryContainer(),
            Positioned(
              top: 0,
              right: 0,
              child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0), child: const SizedBox()),
            ),
            _buildMainContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 120),
            Text(
              "create_password".tr,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
            ),
            const SizedBox(height: 10),
            Text(
              'password_must_be_6_character'.tr,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: AppTextStyles.SMALL_FS),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  DefaultTextField(
                    controller: controller.passWordTextEdittingController,
                    labelText: "password".tr,
                    obscureText: true,
                    validator: ValidateUtil().validatePassword,
                  ),
                  const SizedBox(height: 30),
                  DefaultTextField(
                    controller: controller.confirmPassWordTextEdittingController,
                    labelText: 'Nhập lại mật khẩu',
                    obscureText: true,
                    validator: (String? value) {
                      return ValidateUtil().validateConfirmPassword(value, controller.passWordTextEdittingController.text);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: AppElevatedButton(
                onPressed: () => controller.onPressNext(context),
                buttonHeight: 40,
                radius: 30,
                text: "next".tr,
                buttonBgColor: Colors.black,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
