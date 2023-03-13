import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:voolo_app/modules/auth/view/widgets/blurry_container.dart';
import 'package:get/get.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:voolo_app/shared/utils/encode_string.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';

import '../controller/verify_otp_controller.dart';

class VerifyOtpScreen extends GetView<VerifyOtpController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: controller.screenArg.showAppBar == true
            ? AppBar(
                elevation: 0,
                title: Text(
                  controller.screenArg.appBarTitle,
                  style: AppTextStyles.APP_BAR_TITLE,
                ),
              )
            : null,
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(color: ColorConstants.LIGHT_GREY_SCAFFOLD_BACKGROUND),
          child: Stack(
            alignment: Alignment.topCenter,
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
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimension.SCAFFOLD_HOR_PADDING),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 120),
                      Text(
                        "enter_otp".tr,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28, fontFamily: "Roboto"),
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '${'otp_was_sent_to_email'.tr} ',
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: AppTextStyles.SMALL_FS),
                          children: <TextSpan>[
                            TextSpan(
                              text: EncodeString.encodeEmail(controller.screenArg.newEmail ?? controller.screenArg.email),
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: AppTextStyles.SMALL_FS),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      PinCodeTextField(
                        enableActiveFill: true,
                        appContext: context,
                        pastedTextStyle: TextStyle(color: Colors.green.shade600, fontWeight: FontWeight.bold),
                        length: 6,
                        animationType: AnimationType.fade,
                        mainAxisAlignment: MainAxisAlignment.center,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          borderWidth: 1,
                          fieldHeight: 45,
                          fieldWidth: 40,
                          fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 5),
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          // activeColor: Colors.transparent,
                          // selectedColor: Colors.transparent,
                          inactiveColor: Colors.transparent,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 200),
                        errorAnimationController: controller.errorController,
                        controller: controller.textEditingController,
                        errorAnimationDuration: 0,
                        keyboardType: TextInputType.number,
                        onCompleted: (value) async {},
                        onChanged: (value) {
                          controller.onChangeOtp(value);
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                      ),
                      Obx(() {
                        if (controller.validateOtpError.value.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              controller.validateOtpError.value,
                              style: const TextStyle(color: ColorConstants.RED_ERROR, fontWeight: FontWeight.w400, fontSize: AppTextStyles.SMALL_FS),
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 200,
                        child: Obx(
                          () => AppElevatedButton(
                            onPressed: () => controller.verifyOtp(),
                            buttonHeight: 40,
                            radius: 30,
                            text: "next".tr,
                            buttonBgColor: Colors.black,
                            disabled: !controller.enableNextButton.value,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${'not_received_yet'.tr}? ",
                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: AppTextStyles.SMALL_FS),
                          ),
                          InkWell(
                            onTap: () => controller.onPressResendOtp(),
                            child: Obx(
                              () => Text(
                                "${'resend_otp'.tr} (${controller.counter.value}s)",
                                style: const TextStyle(
                                  color: ColorConstants.BLUE_LINK,
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppTextStyles.SMALL_FS,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${'already_have_an_account'.tr}?  ",
                      style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () => Get.offAndToNamed(Routes.AUTH),
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
}
