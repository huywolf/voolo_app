import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voolo_app/modules/verify_otp/controller/verify_otp_controller.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:voolo_app/shared/constants/server_error_code.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:voolo_app/shared/widgets/dialogs/success_alert_dialog.dart';

import '../data_source/repository/voolo_account_repository.dart';

enum EditingControllerType {
  none,
  fullname,
  email,
  password,
}

class VooloAccountController extends GetxController {
  VooloAccountController();

  final repo = VooloAccountRepository();
  final prefs = Get.find<SharedPreferences>();

  final fullnameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final Rxn<String> fullnameErrorText = Rxn<String>();
  final Rxn<String> phoneNumberErrorText = Rxn<String>();
  final Rxn<String> emailErrorText = Rxn<String>();
  final Rxn<String> passwordErrorText = Rxn<String>();

  final showLoading = false.obs;
  Rx<EditingControllerType> editingControllerType = EditingControllerType.none.obs;

  String oldEmail = '';

  @override
  void onInit() async {
    super.onInit();
    getUserInfo();
    editingControllerType.value = EditingControllerType.none;
  }

  void onTapEditIcon(EditingControllerType type) {
    editingControllerType.value = type;
  }

  void resetError() {
    fullnameErrorText.value = null;
    phoneNumberErrorText.value = null;
    emailErrorText.value = null;
    passwordErrorText.value = null;
  }

  Future<void> getUserInfo() async {
    final userId = prefs.getString(StorageConstants.USER_ID);
    if (userId == null) return;
    showLoading.value = true;
    final res = await repo.getUserInfo(userId: userId);
    showLoading.value = false;
    if (res.status == true) {
      fullnameController.text = res.data?.username ?? '';
      phoneNumberController.text = res.data?.phone ?? '';
      emailController.text = res.data?.email ?? '';
      oldEmail = res.data?.email ?? '';
      const kDefaultPassword = '12345678912';
      passwordController.text = kDefaultPassword;
    }
  }

  Future<void> updateUserInfo(EditingControllerType type, BuildContext context) async {
    final userId = prefs.getString(StorageConstants.USER_ID);
    if (userId == null) return;
    switch (type) {
      case EditingControllerType.fullname:
        fullnameErrorText.value = ValidateUtil().validateFullName(fullnameController.text);
        if (fullnameErrorText.value == null) {
          EasyLoading.show(status: 'loading'.tr);
          final res = await repo.updateUserInfo(userId: userId, data: {'username': fullnameController.text});
          EasyLoading.dismiss();
          if (res.status == false) {
            fullnameErrorText.value = ServerErrorCode().convertStatusCodeToMessage(res.statusCode);
          } else {
            Get.dialog(SuccessAlertDialog(title: 'updated_name_successfully'.tr, content: null));
          }
        }
        break;
      case EditingControllerType.email:
        emailErrorText.value = ValidateUtil().validateEmail(emailController.text);
        if (emailErrorText.value == null) {
          sendOtpUpdateAccount(context);
        }
        break;
      case EditingControllerType.password:
        passwordErrorText.value = ValidateUtil().validatePassword(passwordController.text);
        break;
      default:
    }
  }

  void sendOtpUpdateAccount(BuildContext context) async {
    EasyLoading.show(status: 'loading'.tr);
    final res = await repo.sendOtpUpdateAccount(
      email: oldEmail,
      newEmail: emailController.text,
    );
    EasyLoading.dismiss();

    if (res.status == true) {
      Get.toNamed(
        Routes.VERIFY_OTP,
        arguments: VerifyOtpScreenArg(
          fullName: '',
          phoneNumber: '',
          email: oldEmail,
          newEmail: emailController.text,
          verifyOtpType: VerifyOtpType.updateEmail,
          showAppBar: true,
          appBarTitle: 'voolo_account'.tr,
        ),
      )?.then((value) {
        if (value is bool && value == true) {
          Get.dialog(SuccessAlertDialog(
            title: 'update_email_successfully'.tr,
            content: null,
          ));
          AppFocus.unfocus(context);
          resetError();
          editingControllerType.value = EditingControllerType.none;
        }
      });
    } else {
      emailErrorText.value = ServerErrorCode().convertStatusCodeToMessage(res.statusCode);
    }
  }
}
