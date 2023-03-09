import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VooloAccountController extends GetxController {
  VooloAccountController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
