import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voolo_app/modules/auth/view/widgets/blurry_container.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:voolo_app/shared/widgets/input/default_textfield.dart';

import '../controller/voolo_account_controller.dart';

class VooloAccountScreen extends GetView<VooloAccountController> {
  const VooloAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'voolo_account'.tr,
            style: AppTextStyles.APP_BAR_TITLE,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(color: ColorConstants.LIGHT_GREY_SCAFFOLD_BACKGROUND),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const BlurryContainer(),
              Positioned(
                top: -40,
                right: 0,
                child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0), child: const SizedBox()),
              ),
              Obx(
                (() {
                  if (controller.showLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return _buildMainContent(context);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            DefaultTextField(
              controller: controller.fullnameController,
              labelText: "full_name".tr,
              errorText: controller.fullnameErrorText.value,
              readOnly: controller.editingControllerType.value != EditingControllerType.fullname,
              suffixEditIcon: controller.editingControllerType.value != EditingControllerType.fullname
                  ? _buildSuffixIcon(type: EditingControllerType.fullname)
                  : null,
              extendSuffixWidget: controller.editingControllerType.value == EditingControllerType.fullname
                  ? _buildExtendWidget(type: EditingControllerType.fullname, context: context)
                  : null,
            ),
            const SizedBox(height: 30),
            DefaultTextField(
              controller: controller.phoneNumberController,
              labelText: "phone_number".tr,
              validator: ValidateUtil().validatePhoneNumber,
              readOnly: true,
            ),
            const SizedBox(height: 30),
            DefaultTextField(
              controller: controller.emailController,
              labelText: "email".tr,
              validator: ValidateUtil().validateEmail,
              errorText: controller.emailErrorText.value,
              readOnly: controller.editingControllerType.value != EditingControllerType.email,
              suffixEditIcon:
                  controller.editingControllerType.value != EditingControllerType.email ? _buildSuffixIcon(type: EditingControllerType.email) : null,
              extendSuffixWidget: controller.editingControllerType.value == EditingControllerType.email
                  ? _buildExtendWidget(type: EditingControllerType.email, context: context)
                  : null,
            ),
            const SizedBox(height: 30),
            DefaultTextField(
              controller: controller.passwordController,
              labelText: "password".tr,
              obscureText: true,
              showVisibilityIcon: false,
              readOnly: true,
              suffixEditIcon: _buildSuffixIcon(type: EditingControllerType.password),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildExtendWidget({required EditingControllerType type, required BuildContext context}) {
    return Row(
      children: [
        const SizedBox(width: 8),
        InkWell(
          onTap: () => controller.updateUserInfo(type, context),
          child: SvgPicture.asset(Assets.ICON_CHECK),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () => controller.onTapEditIcon(EditingControllerType.none),
          child: SvgPicture.asset(Assets.ICON_CLOSE),
        ),
      ],
    );
  }

  Widget _buildSuffixIcon({required EditingControllerType type}) {
    return InkWell(
      onTap: () => controller.onTapEditIcon(type),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 18),
        child: SvgPicture.asset(Assets.ICON_EDIT_TEXTFIELD),
      ),
    );
  }
}
