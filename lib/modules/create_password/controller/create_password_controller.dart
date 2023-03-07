import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:voolo_app/modules/auth/data_source/repository/auth_repository.dart';

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

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onPressResendOtp() async {
    EasyLoading.show(status: 'loading'.tr);

    EasyLoading.dismiss();
  }
}
