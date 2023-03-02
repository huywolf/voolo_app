import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  bool registerTermsChecked = false;

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
  }

  void register(BuildContext context) async {
    AppFocus.unfocus(context);

    if (registerFormKey.currentState!.validate()) {
      EasyLoading.show(status: 'loading'.tr);
      final res = await repo.sendOTP(
        fullName: registerFullNameController.text,
        phoneNumber: registerPhoneNumberController.text,
        email: registerEmailController.text,
      );
      EasyLoading.dismiss();

      if (res != null) {
        Get.offAndToNamed(Routes.VERIFY_OTP,
            arguments: VerifyOtpScreenArg(
              fullName: registerFullNameController.text,
              phoneNumber: registerPhoneNumberController.text,
              email: registerEmailController.text,
            ));
      } else {
        // handle error
      }
    }
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
