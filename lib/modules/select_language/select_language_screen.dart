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
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset(Assets.VOOLO_ICON, width: 165),
        ),
        toolbarHeight: 60,
      ),
      body: Stack(
        children: [
          Container(color: const Color(0xffEEEEEE)),
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
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),
          Text(
            "choose_language".tr,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: AppTextStyles.MIDLE_LARGE_FS, fontFamily: 'Roboto'),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Obx(() => _buildLanguageBtn(
                            type: LanguageType.vietnamese,
                            lable: 'vietnamese'.tr,
                            asset: Assets.VIETNAMESE_LANG,
                            isSelected: controller.curLanguageType.value == LanguageType.vietnamese,
                          )),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Obx(() => _buildLanguageBtn(
                            type: LanguageType.english,
                            lable: 'english'.tr,
                            asset: Assets.ENGLISH_LANG,
                            isSelected: controller.curLanguageType.value == LanguageType.english,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  child: Obx(() => AppElevatedButton(
                        onPressed: () => controller.onPressNextButton(),
                        buttonHeight: 45,
                        radius: 30,
                        text: "continue".tr,
                        buttonBgColor: Colors.black,
                        disabled: controller.curLanguageType.value == LanguageType.none,
                      )),
                ),
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
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(color: ColorConstants.GREY_BODER),
          borderRadius: BorderRadius.circular(34),
        ),
        child: Row(
          children: [
            Image.asset(asset, height: 45),
            const SizedBox(width: 10),
            Text(lable,
                style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: AppTextStyles.NORMAL_FS, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
