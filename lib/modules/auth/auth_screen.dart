import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/modules/auth/auth.dart';
import 'package:voolo_app/routes/routes.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';
import 'package:voolo_app/shared/widgets/input/default_textfield.dart';

import 'widgets/blurry_container.dart';

class AuthScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig().screenHeight * 0.2 - 30),
                    Text(
                      "Xin chào",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48, fontFamily: "Roboto"),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Đăng nhập để khám phá nhé!",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          DefaultTextField(
                            onChanged: (value) {},
                            labelText: "Số điện thoại/Email",
                          ),
                          const SizedBox(height: 20),
                          DefaultTextField(
                            onChanged: (value) {},
                            labelText: "Mật khẩu",
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Quên mật khẩu?",
                                style: TextStyle(color: Color(0xff197DDE), fontSize: 13, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          const SizedBox(height: 60),
                          SizedBox(
                            width: 250,
                            child: AppElevatedButton(
                              onPressed: () async {},
                              buttonHeight: 40,
                              radius: 30,
                              text: "Đăng nhập",
                              buttonBgColor: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 100),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Bạn chưa có tài khoản?  ",
                                style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                              InkWell(
                                onTap: () => Get.toNamed(Routes.AUTH + Routes.REGISTER, arguments: controller),
                                child: Text(
                                  "Đăng ký ngay",
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
            ],
          ),
        ),
      ),
    );
  }
}
