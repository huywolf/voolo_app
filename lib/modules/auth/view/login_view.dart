import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';
import 'package:voolo_app/shared/widgets/input/default_textfield.dart';

import '../controller/auth_controller.dart';
import 'widgets/blurry_container.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const BlurryContainer(),
              Positioned(
                top: 0,
                right: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                  child: const SizedBox(),
                ),
              ),
              _buildMainContent(context),
              Positioned(
                bottom: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Bạn chưa có tài khoản?  ",
                      style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () => controller.switchView(1),
                      child: const Text(
                        "Đăng ký",
                        style: TextStyle(
                          color: ColorConstants.BLUE_LINK,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 120),
          const Text(
            "Đăng nhập",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, fontFamily: "Roboto"),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  DefaultTextField(
                    controller: controller.loginPhoneEmailController,
                    labelText: "Số điện thoại/Email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập số điện thoại/email.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  DefaultTextField(
                    controller: controller.loginPasswordController,
                    labelText: "Mật khẩu",
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập mật khẩu.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Quên mật khẩu?",
                        style: TextStyle(color: Color(0xff197DDE), fontSize: 13, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(height: 60),
                  AppElevatedButton(
                    onPressed: () async {
                      controller.login(context);
                    },
                    buttonHeight: 40,
                    radius: 30,
                    text: "Đăng nhập",
                    buttonBgColor: Colors.black,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
