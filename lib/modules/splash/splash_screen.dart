import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voolo_app/modules/auth/view/widgets/blurry_container.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/shared.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    navigate();
  }

  void navigate() async {
    animationController.repeat();

    await Future.delayed(const Duration(seconds: 2));
    var storage = Get.find<SharedPreferences>();

    try {
      if (storage.getString(StorageConstants.ACCESS_TOKEN) != null) {
        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.offAndToNamed(Routes.SELECT_LANGUAGE);
      }
    } catch (e) {
      Get.offAndToNamed(Routes.AUTH);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: const Color(0xffEEEEEE),
      child: Stack(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: AnimatedBuilder(
                animation: animationController,
                child: SvgPicture.asset(Assets.ICON_VOOLO_LOGO, height: 150),
                builder: (BuildContext context, Widget? widget) {
                  return Transform.rotate(
                    angle: animationController.value * 6.3,
                    child: widget,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
