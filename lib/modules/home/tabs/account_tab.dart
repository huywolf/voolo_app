import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voolo_app/modules/auth/view/widgets/blurry_container.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';

class AccountTab extends GetView<HomeController> {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const SizedBox(),
        title: Text(
          'individual'.tr,
          style: AppTextStyles.APP_BAR_TITLE,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: SvgPicture.asset(Assets.ICON_NOTIFICATION, height: 35),
          ),
        ],
      ),
      body: _buildListItems(),
    );
  }

  Widget _buildListItems() {
    return Container(
      height: Get.height,
      decoration: const BoxDecoration(color: ColorConstants.LIGHT_GREY_SCAFFOLD_BACKGROUND),
      child: Stack(
        children: [
          const BlurryContainer(),
          Positioned(
            top: -40,
            right: 0,
            child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0), child: const SizedBox()),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildFirstCard(),
                const SizedBox(height: 20),
                _buildSecondCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimension.SCAFFOLD_HOR_PADDING),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Color.fromRGBO(53, 63, 79, 0.1), blurRadius: 5, offset: Offset(2, 2)),
          BoxShadow(color: Color.fromRGBO(53, 63, 79, 0.15), blurRadius: 5, offset: Offset(-2, 3)),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          AccountItem(
            icon: Image.asset(Assets.ACC_PERSON, height: 25),
            title: "voolo_account".tr,
            onTap: () => Get.toNamed(Routes.VOOLO_ACCOUNT),
          ),
          AccountItem(
            icon: Image.asset(Assets.ACC_BNPL_ACCOUNT, height: 24),
            title: "prepaid_account".tr,
            onTap: () => Get.toNamed(Routes.VERIFY_BNPL),
          ),
          AccountItem(
            icon: Image.asset(Assets.ACC_STAR, height: 25),
            title: "payment_plan".tr,
            onTap: () {},
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildSecondCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimension.SCAFFOLD_HOR_PADDING),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Color.fromRGBO(53, 63, 79, 0.1), blurRadius: 5, offset: Offset(2, 2)),
          BoxShadow(color: Color.fromRGBO(53, 63, 79, 0.15), blurRadius: 5, offset: Offset(-2, 3)),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          AccountItem(
            icon: Image.asset(Assets.ACC_SETTING, height: 25),
            title: "setting".tr,
            onTap: () {},
          ),
          AccountItem(
            icon: Image.asset(Assets.ACC_QUESTION, height: 25),
            title: "frequently_question".tr,
            onTap: () {},
          ),
          AccountItem(
            icon: Image.asset(Assets.ACC_LOGOUT, height: 25),
            title: "logout".tr,
            onTap: () {
              controller.signout();
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
