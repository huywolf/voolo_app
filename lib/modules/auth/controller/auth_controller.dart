import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:voolo_app/dio/eap/dio_response.dart';
import 'package:voolo_app/modules/verify_otp/controller/verify_otp_controller.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_source/repository/auth_repository.dart';

class AuthController extends GetxController {
  AuthController();

  final AuthRepository repo = AuthRepository();

  RxInt viewIndex = 0.obs;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerFullNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPhoneNumberController = TextEditingController();
  final phoneErrorText = Rxn<String>();
  final emailErrorText = Rxn<String>();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginPhoneEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  void switchView(int index) {
    viewIndex.value = index;
    resetErrorText();
    if (index == 0) {
      resetRegisterTextController();
    }
  }

  void register(BuildContext context) async {
    AppFocus.unfocus(context);

    if (registerFormKey.currentState!.validate()) {
      resetErrorText();
      EasyLoading.show(status: 'loading'.tr);
      final res = await repo.sendOTP(
        fullName: registerFullNameController.text,
        phoneNumber: registerPhoneNumberController.text,
        email: registerEmailController.text,
      );
      EasyLoading.dismiss();

      if (res.status == true) {
        Get.offAndToNamed(
          Routes.VERIFY_OTP,
          arguments: VerifyOtpScreenArg(
            fullName: registerFullNameController.text,
            phoneNumber: registerPhoneNumberController.text,
            email: registerEmailController.text,
          ),
        );
      } else {
        switch (res.statusCode) {
          case StatusCode.PHONE_NUMBER_ALREADY_EXIST:
            phoneErrorText.value = 'that_phone_number_is_taken'.tr;
            break;
          case StatusCode.EMAIL_ALREADY_EXIST:
            emailErrorText.value = 'that_email_is_taken'.tr;
            break;
          default:
        }
      }
    }
  }

  void resetErrorText() {
    phoneErrorText.value = null;
    emailErrorText.value = null;
  }

  void resetRegisterTextController() {
    registerFullNameController.clear();
    registerEmailController.clear();
    registerPhoneNumberController.clear();
  }

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      // final res = await apiRepository.login(
      //   LoginRequest(
      //     email: loginPhoneEmailController.text,
      //     password: loginPasswordController.text,
      //   ),
      // );

      final prefs = Get.find<SharedPreferences>();
      prefs.setString(StorageConstants.PHONE_NUMBER, loginPhoneEmailController.text);
      Get.toNamed(Routes.HOME);
      // if (res!.token.isNotEmpty) {
      //   prefs.setString(StorageConstants.token, res.token);
      //   Get.toNamed(Routes.HOME);
      // }
    }
  }
}
