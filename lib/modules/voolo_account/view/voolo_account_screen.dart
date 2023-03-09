import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/modules/auth/view/widgets/blurry_container.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
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
              _buildMainContent(context),
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
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              DefaultTextField(
                controller: controller.fullnameController,
                labelText: "full_name".tr,
                validator: ValidateUtil().validateFullName,
              ),
              const SizedBox(height: 30),
              DefaultTextField(
                controller: controller.phoneNumberController,
                labelText: "phone_number".tr,
                validator: ValidateUtil().validatePhoneNumber,
              ),
              const SizedBox(height: 30),
              DefaultTextField(
                controller: controller.emailController,
                labelText: "email".tr,
                validator: ValidateUtil().validateEmail,
              ),
              const SizedBox(height: 30),
              DefaultTextField(
                controller: controller.passwordController,
                labelText: "password".tr,
                obscureText: true,
                validator: ValidateUtil().validatePassword,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
