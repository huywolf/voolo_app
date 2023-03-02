import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:voolo_app/modules/introduction/introduction_controller.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/shared.dart';

class IntroductionScreen extends GetView<IntroductionController> {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset(Assets.vooloIcon, width: 165),
        ),
        toolbarHeight: 60,
      ),
      body: PageView(
        controller: controller.pageViewController,
        onPageChanged: controller.onPageChange,
        children: [
          buidPageView(
            imagePath: Assets.introductionScreen1,
            text: "unlimited_shopping".tr,
          ),
          buidPageView(
            imagePath: Assets.introductionScreen2,
            text: "flexible_shopping".tr,
          ),
          buidPageView(
            imagePath: Assets.introductionScreen3,
            text: "zero_interest".tr,
            imagePadding: 30,
          ),
        ],
      ),
      bottomSheet: Container(
        color: ColorConstants.GREY_SCAFFOLD_BG_COLOR,
        alignment: Alignment.center,
        height: 100,
        padding: const EdgeInsets.only(bottom: 50),
        child: SmoothPageIndicator(
          controller: controller.pageViewController,
          count: 3,
          effect: const WormEffect(
            dotWidth: 11.0,
            dotHeight: 11.0,
            activeDotColor: Color(0xFF197DDE),
            dotColor: Color(0xffE4E4E4),
          ),
        ),
      ),
    );
  }

  Widget buidPageView({
    required String imagePath,
    required String text,
    double? imagePadding,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          SizedBox(
            height: SizeConfig().screenWidth + 100,
            child: Image.asset(
              imagePath,
              width: SizeConfig().screenWidth,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: ColorConstants.blackText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
