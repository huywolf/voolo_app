import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../data_source/repository/verify_bnpl_repository.dart';

class VerifyOtpScreenArg {
  VerifyOtpScreenArg({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
  });

  final String fullName;
  final String phoneNumber;
  final String email;
}

class VerifyOtpController extends GetxController {
  VerifyOtpController();

  final VerifyOtpRepository repo = VerifyOtpRepository();
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

  Future<void> verifyOtp() async {
    EasyLoading.show(status: 'loading'.tr);
    final res = await repo.verifyOtp(
      fullname: screenArg.fullName,
      email: screenArg.email,
      phoneNumber: screenArg.phoneNumber,
      otp: textEditingController.text,
    );
    EasyLoading.dismiss();
    if (res?.status == true) {
      // next step
    } else {
      if (res?.statusCode == 1004) {
        validateOtpError.value = 'invalid_otp'.tr;
        countFail.value += 1;
      }
    }
  }
}