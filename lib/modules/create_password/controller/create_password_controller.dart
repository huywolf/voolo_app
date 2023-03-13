import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voolo_app/modules/auth/data_source/repository/auth_repository.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:voolo_app/shared/constants/server_error_code.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:voolo_app/shared/widgets/dialogs/success_alert_dialog.dart';
import 'package:voolo_app/shared/widgets/dialogs/unsuccess_alert_dialog.dart';

import '../data_source/model/register_request.dart';
import '../data_source/repository/create_password_repository.dart';

class CreatePasswordScreenArg {
  CreatePasswordScreenArg({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
  });

  final String fullName;
  final String phoneNumber;
  final String email;
}

class CreatePasswordController extends GetxController {
  CreatePasswordController();

  final CreatePasswordScreenArg screenArg = Get.arguments;
  final repo = CreatePasswordRepository();
  final authRepo = AuthRepository();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final passWordTextEdittingController = TextEditingController();
  final confirmPassWordTextEdittingController = TextEditingController();

  void onPressNext(BuildContext context) async {
    AppFocus.unfocus(context);
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'loading'.tr);
      final res = await repo.register(
        data: RegisterRequest(
          username: screenArg.fullName,
          email: screenArg.email,
          phone: screenArg.phoneNumber,
          password: passWordTextEdittingController.text,
        ),
      );
      EasyLoading.dismiss();

      if (res.status == false) {
        Get.dialog(UnSuccessAlertDialog(
          content: ServerErrorCode().convertStatusCodeToMessage(res.errorCode),
        ));
      } else {
        Get.dialog(SuccessAlertDialog(
          title: 'you_have_successfully_registered'.tr,
          content: 'system_automatically_login'.tr,
        ));
        Future.delayed(const Duration(seconds: 5), () async {
          Get.back();
          EasyLoading.show(status: 'loading'.tr);
          final loginResponse = await authRepo.login(phoneOrEmail: screenArg.phoneNumber, password: confirmPassWordTextEdittingController.text);
          EasyLoading.dismiss();
          if (loginResponse.status == true) {
            if (loginResponse.token != null && loginResponse.token!.isNotEmpty) {
              final prefs = Get.find<SharedPreferences>();
              prefs.setString(StorageConstants.ACCESS_TOKEN, loginResponse.token!);
              prefs.setString(StorageConstants.REFRESH_TOKEN, loginResponse.data?.refreshToken ?? '');
              prefs.setString(StorageConstants.USER_ID, loginResponse.data?.id ?? '');

              Map<String, dynamic> payload = Jwt.parseJwt(loginResponse.token!);
              if (payload.containsKey('email')) {
                prefs.setString(StorageConstants.EMAIL, loginResponse.token!);
              }
              if (payload.containsKey('phone')) {
                prefs.setString(StorageConstants.EMAIL, loginResponse.token!);
              }
            }
            Get.toNamed(Routes.HOME);
          } else {
            Get.dialog(UnSuccessAlertDialog(
              content: ServerErrorCode().convertStatusCodeToMessage(loginResponse.statusCode),
            ));
          }
        });
      }
    }
  }
}
