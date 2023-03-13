import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:voolo_app/shared/utils/utils.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';
import 'package:voolo_app/shared/widgets/input/default_textfield.dart';

import '../../controller/voolo_account_controller.dart';

class ChangePasswordDialog extends GetView<VooloAccountController> {
  const ChangePasswordDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffF3F3F3),
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: SizedBox(
        width: Get.width,
        child: Form(
          key: controller.changePasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'change_password'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: AppTextStyles.MIDLE_LARGE_FS,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 30),
              DefaultTextField(
                controller: controller.changeOldPasswordController,
                labelText: "old_password".tr,
                obscureText: true,
                showVisibilityIcon: true,
                validator: ValidateUtil().validatePassword,
              ),
              const SizedBox(height: 25),
              DefaultTextField(
                controller: controller.changeNewPasswordController,
                labelText: "new_password".tr,
                obscureText: true,
                showVisibilityIcon: true,
                validator: (value) => ValidateUtil().validateNewPassword(value, controller.changeOldPasswordController.text),
              ),
              const SizedBox(height: 25),
              DefaultTextField(
                controller: controller.changeConfirmPasswordController,
                labelText: "confirm_password".tr,
                obscureText: true,
                showVisibilityIcon: true,
                validator: (value) => ValidateUtil().validateConfirmPassword(value, controller.changeNewPasswordController.text),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: 200,
                child: AppElevatedButton(
                  onPressed: () => controller.updateUserInfo(EditingControllerType.password, context),
                  buttonHeight: Dimension.K_BUTTON_HEIGHT,
                  radius: 30,
                  text: "update".tr,
                  buttonBgColor: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
