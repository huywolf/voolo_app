import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:voolo_app/modules/auth/data_source/repository/auth_repository.dart';
import 'package:voolo_app/modules/create_password/controller/create_password_controller.dart';
import 'package:voolo_app/routes/app_pages.dart';

import '../data_source/repository/verify_bnpl_repository.dart';

enum VerifyOtpType {
  createNewAccount,
  updateEmail,
}

class VerifyOtpScreenArg {
  VerifyOtpScreenArg({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.newEmail,
    required this.verifyOtpType,
    required this.showAppBar,
    required this.appBarTitle,
  });

  final String fullName;
  final String phoneNumber;
  final String email;
  final String? newEmail;
  final VerifyOtpType verifyOtpType;
  final bool showAppBar;
  final String appBarTitle;
}

class VerifyOtpController extends GetxController {
  VerifyOtpController();

  final VerifyOtpRepository repo = VerifyOtpRepository();
  final AuthRepository authRepo = AuthRepository();
  final VerifyOtpScreenArg screenArg = Get.arguments;

  late StreamController<ErrorAnimationType> errorController;
  final TextEditingController textEditingController = TextEditingController();

  RxBool enableNextButton = false.obs;
  late Timer timer;
  RxInt counter = 59.obs;
  RxString validateOtpError = ''.obs;
  RxInt countFail = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    errorController = StreamController<ErrorAnimationType>();
    startTimer();
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
    errorController.close();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (counter.value == 0) {
          timer.cancel();
        } else {
          counter.value--;
        }
      },
    );
  }

  Future<void> onPressResendOtp() async {
    EasyLoading.show(status: 'loading'.tr);
    counter.value = 59;
    await authRepo.sendOTP(
      fullName: screenArg.fullName,
      phoneNumber: screenArg.phoneNumber,
      email: screenArg.email,
    );
    EasyLoading.dismiss();
    startTimer();
  }

  void onChangeOtp(String value) {
    if (value.length == 6) {
      enableNextButton.value = true;
    } else {
      enableNextButton.value = false;
    }
  }

  void verifyOtp() {
    if (screenArg.verifyOtpType == VerifyOtpType.createNewAccount) {
      verifyOtpCreateAccount();
    } else if (screenArg.verifyOtpType == VerifyOtpType.updateEmail) {
      verifyOtpUpdateAccount();
    }
  }

  Future<void> verifyOtpCreateAccount() async {
    EasyLoading.show(status: 'loading'.tr);
    final res = await repo.verifyOtp(
      fullname: screenArg.fullName,
      email: screenArg.email,
      phoneNumber: screenArg.phoneNumber,
      otp: textEditingController.text,
    );
    EasyLoading.dismiss();
    if (res.status == true) {
      Get.offAndToNamed(Routes.CREATE_PASSWORD,
          arguments: CreatePasswordScreenArg(
            fullName: screenArg.fullName,
            email: screenArg.email,
            phoneNumber: screenArg.phoneNumber,
          ));
    } else {
      returnVerifyOtpError(res.statusCode);
    }
  }

  Future<void> verifyOtpUpdateAccount() async {
    EasyLoading.show(status: 'loading'.tr);
    final res = await repo.verifyOtpUpdateAccount(
      email: screenArg.email,
      newEmail: screenArg.newEmail ?? '',
      otp: textEditingController.text,
    );
    EasyLoading.dismiss();
    if (res.status == true) {
      Get.back(result: true);
    } else {
      returnVerifyOtpError(res.statusCode);
    }
  }

  void returnVerifyOtpError(int? statusCode) {
    if (statusCode == 1004) {
      countFail.value += 1;
      validateOtpError.value = '${'invalid_otp'.tr} (${countFail.value}/5)';
      return;
    }
    if (statusCode == 3000) {
      validateOtpError.value = 'expired_otp'.tr;
      return;
    }
    if (statusCode == 0) {
      validateOtpError.value = 'default_error_msg'.tr;
      return;
    }
  }
}
