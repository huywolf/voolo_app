import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';
import 'package:voolo_app/shared/widgets/input/default_textfield.dart';

import '../controller/auth_controller.dart';
import 'widgets/blurry_container.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const BlurryContainer(),
          Positioned(
            top: -40,
            right: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
              child: const SizedBox(),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: controller.registerFormKey,
              child: Column(
                children: [
                  const SizedBox(height: 120),
                  const Text(
                    "Đăng ký",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, fontFamily: "Roboto"),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Column(
                      children: [
                        DefaultTextField(
                          controller: controller.registerFullNameController,
                          labelText: "Họ và tên",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Vui lòng nhập họ và tên';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        DefaultTextField(
                          controller: controller.registerPhoneNumberController,
                          labelText: "Số điện thoại",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Vui lòng nhập số điện thoại';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        DefaultTextField(
                          controller: controller.registerEmailController,
                          labelText: "Email",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Vui lòng nhập số email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 60),
                        AppElevatedButton(
                          onPressed: () {
                            controller.register(context);
                          },
                          buttonHeight: 40,
                          radius: 30,
                          text: "Đăng ký",
                          buttonBgColor: Colors.black,
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bạn đã có tài khoản?  ",
                  style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
                ),
                InkWell(
                  onTap: () => controller.switchView(0),
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(
                      color: ColorConstants.blueLink,
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
    );
  }
}
