import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import 'login_view.dart';
import 'register_view.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Obx(() {
          if (controller.viewIndex.value == 0) {
            return const LoginView();
          }
          if (controller.viewIndex.value == 1) {
            return const RegisterView();
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
