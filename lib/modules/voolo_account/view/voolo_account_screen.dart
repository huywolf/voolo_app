import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:voolo_app/modules/auth/view/widgets/blurry_container.dart';
import 'package:get/get.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/shared.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: Dimension.SCAFFOLD_HOR_PADDING),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 120),
            Text(
              "enter_otp".tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28, fontFamily: "Roboto"),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
