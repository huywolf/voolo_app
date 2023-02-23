import 'dart:io' show Platform;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/modules/auth/auth.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';
import 'package:voolo_app/shared/widgets/input/default_textfield.dart';

import 'widgets/blurry_container.dart';

class RegisterScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFFF3F3F3)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            BlurryContainer(),
            Positioned(
              top: -40,
              right: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                child: Image.asset(Assets.partVooloLogo, height: SizeConfig().screenHeight * 0.2),
              ),
            ),
            Positioned(
              top: SizeConfig().screenHeight * 0.4,
              left: 3,
              child: Image.asset(Assets.blurryVooloLogo, height: 150),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig().screenHeight * 0.2 - 30),
                  Text(
                    "Đăng ký",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, fontFamily: "Roboto"),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Column(
                      children: [
                        DefaultTextField(
                          labelText: "Họ và tên",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required.';
                            }

                            if (value.length < 6 || value.length > 15) {
                              return 'Password should be 6~15 characters';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        DefaultTextField(
                          labelText: "Số điện thoại",
                        ),
                        const SizedBox(height: 20),
                        DefaultTextField(
                          labelText: "Email",
                        ),
                        const SizedBox(height: 60),
                        SizedBox(
                          width: 250,
                          child: AppElevatedButton(
                            onPressed: () async {},
                            buttonHeight: 40,
                            radius: 30,
                            text: "Đăng ký",
                            buttonBgColor: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 100),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bạn đã có tài khoản?  ",
                              style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            InkWell(
                              onTap: () => Get.back(),
                              child: Text(
                                "Đăng nhập",
                                style: TextStyle(
                                  color: Color(0xff197DDE),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 25,
              left: 25,
              child: InkWell(
                onTap: () => Get.back(),
                child: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
