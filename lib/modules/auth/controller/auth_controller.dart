import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:voolo_app/modules/verify_otp/controller/verify_otp_controller.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:voolo_app/shared/constants/server_error_code.dart';
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
  final registerErrorText = Rxn<String>();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginPhoneEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final loginErrorText = Rxn<String>();

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
    } else {
      resetLoginTextController();
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
        registerErrorText.value = ServerErrorCode().convertStatusCodeToMessage(res.statusCode);
      }
    }
  }

  void resetErrorText() {
    registerErrorText.value = null;
    loginErrorText.value = null;
  }

  void resetRegisterTextController() {
    registerFullNameController.clear();
    registerEmailController.clear();
    registerPhoneNumberController.clear();
  }

  void resetLoginTextController() {
    loginPhoneEmailController.clear();
    loginPasswordController.clear();
  }

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      loginErrorText.value = null;

      EasyLoading.show(status: 'loading'.tr);
      final res = await repo.login(
        phoneOrEmail: loginPhoneEmailController.text,
        password: loginPasswordController.text,
      );
      EasyLoading.dismiss();

      if (res.status == false) {
        loginErrorText.value = ServerErrorCode().convertStatusCodeToMessage(res.statusCode);
      } else {
        if (res.token != null && res.token!.isNotEmpty) {
          final prefs = Get.find<SharedPreferences>();
          Map<String, dynamic> payload = Jwt.parseJwt(res.token!);
          prefs.setString(StorageConstants.ACCESS_TOKEN, res.token!);
          if (payload.containsKey('email')) {
            prefs.setString(StorageConstants.EMAIL, res.token!);
          }
          if (payload.containsKey('phone')) {
            prefs.setString(StorageConstants.EMAIL, res.token!);
          }
        }
        Get.toNamed(Routes.HOME);
      }
    }
  }
}
