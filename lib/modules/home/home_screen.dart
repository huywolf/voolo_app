import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/constants/assets.dart';

import 'home.dart';
import 'widgets/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final iconList = [
    Assets.BOT_NAV_HOME,
    Assets.BOT_NAV_HISTORY,
    Assets.BOT_NAV_PROMO,
    Assets.BOT_NAV_ACCOUNT,
  ];

  final iconListActive = [
    Assets.BOT_NAV_HOME_ACTIVE,
    Assets.BOT_NAV_HISTORY_ACTIVE,
    Assets.BOT_NAV_PROMO_ACTIVE,
    Assets.BOT_NAV_ACCOUNT_ACTIVE,
  ];

  final tabTitle = <String>[
    'home'.tr,
    'history'.tr,
    'promo'.tr,
    'account'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => Scaffold(
            body: _buildContent(controller.currentTabIndex.value),
            floatingActionButton: FloatingActionButton(
              child: Image.asset(Assets.BOT_NAV_SCAN),
              onPressed: () {},
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomBottomNavBar.builder(
              itemCount: iconList.length,
              centerTitle: Container(
                alignment: Alignment.center,
                width: 80,
                child: const Text(
                  'QRCode',
                  style: TextStyle(fontSize: 12, color: Color(0xffA1A1A1), fontWeight: FontWeight.w500),
                ),
              ),
              tabBuilder: (int index, bool isActive) {
                final isOverflow = index == 2 ? true : false;
                var iconSize = 24.0;
                if (index == 1 || index == 3) {
                  iconSize = 22;
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(isActive ? iconListActive[index] : iconList[index], height: iconSize),
                    SizedBox(height: isOverflow ? 0 : 5),
                    isOverflow
                        ? Container(
                            padding: const EdgeInsets.only(top: 5),
                            height: 20,
                            child: OverflowBox(
                              maxWidth: 200,
                              child: Text(
                                tabTitle[index],
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isActive ? const Color(0xFF505050) : const Color(0xffA1A1A1),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        : AutoSizeText(
                            tabTitle[index],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 12, color: isActive ? const Color(0xFF505050) : const Color(0xffA1A1A1), fontWeight: FontWeight.w500),
                          )
                  ],
                );
              },
              backgroundColor: Colors.white,
              activeIndex: controller.currentTabIndex.value,
              notchSmoothness: NotchSmoothness.softEdge,
              gapLocation: GapLocation.center,
              leftCornerRadius: 15,
              rightCornerRadius: 15,
              onTap: (index) => controller.switchTab(index),
              shadow: const BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 12,
                spreadRadius: 0.5,
                color: Color(0xffD9D8D8),
              ),
            ),
          )),
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return controller.homeTab;
      case 1:
        return controller.historyTab;
      case 2:
        return controller.promoTab;
      case 3:
        return controller.accountTab;
      default:
        return const SizedBox();
    }
  }
}
