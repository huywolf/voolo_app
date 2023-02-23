import 'package:flutter/material.dart';
import 'package:voolo_app/api/api.dart';
import 'package:voolo_app/models/models.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final ApiRepository apiRepository;
  AuthController({required this.apiRepository});

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginPhoneEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  bool enableLoginButton = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first.');
        return;
      }

      final res = await apiRepository.register(
        RegisterRequest(
          email: registerEmailController.text,
          password: registerPasswordController.text,
        ),
      );

      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.token);
        print('Go to Home screen>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
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
      prefs.setString(StorageConstants.phoneNumber, loginPhoneEmailController.text);
      Get.toNamed(Routes.HOME);
      // if (res!.token.isNotEmpty) {
      //   prefs.setString(StorageConstants.token, res.token);
      //   Get.toNamed(Routes.HOME);
      // }
    }
  }

  @override
  void onClose() {
    super.onClose();

    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();

    loginPhoneEmailController.dispose();
    loginPasswordController.dispose();
  }
}
