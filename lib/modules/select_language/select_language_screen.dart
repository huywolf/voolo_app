import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voolo_app/modules/auth/view/widgets/blurry_container.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';

import 'select_language_controller.dart';

class SelectLanguageScreen extends GetView<SelectLanguageController> {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: const Color(0xffEEEEEE),
      child: Stack(
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
          _buildMainContent(context)
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 80),
          Image.asset(Assets.vooloIcon, width: 200),
          const SizedBox(height: 30),
          Text(
            "choose_your_language".tr,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: AppTextStyles.mediumFS, fontFamily: "Montserrat"),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              children: [
                Obx(() => _buildLanguageBtn(
                      type: LanguageType.vietnamese,
                      lable: 'vietnamese'.tr,
                      asset: Assets.vietnameseLang,
                      isSelected: controller.curLanguageType.value == LanguageType.vietnamese,
                    )),
                const SizedBox(height: 20),
                Obx(() => _buildLanguageBtn(
                      type: LanguageType.english,
                      lable: 'english'.tr,
                      asset: Assets.englishLang,
                      isSelected: controller.curLanguageType.value == LanguageType.english,
                    )),
                const SizedBox(height: 50),
                Obx(() => AppElevatedButton(
                      onPressed: () async {},
                      buttonHeight: 45,
                      radius: 30,
                      text: "continue".tr,
                      buttonBgColor: Colors.black,
                      disabled: controller.curLanguageType.value == LanguageType.none,
                    )),
                const SizedBox(height: 50),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLanguageBtn({
    required LanguageType type,
    required String lable,
    required String asset,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => controller.chooseLanguage(type),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffDADADA) : Colors.white,
          border: Border.all(color: ColorConstants.greyBoder),
          borderRadius: BorderRadius.circular(34),
        ),
        child: Row(
          children: [
            Text(lable, style: AppTextStyles.normal),
            const Expanded(child: SizedBox()),
            Image.asset(asset, height: 45),
          ],
        ),
      ),
    );
  }
}
