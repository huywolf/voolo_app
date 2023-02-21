import 'package:flutter/material.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/shared/shared.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => _buildWidget()),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      body: Center(
        child: _buildContent(controller.currentTab.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavigationBarItem(
            'home'.tr,
            MainTabs.home == controller.currentTab.value ? "icon_home_activited.svg" : "icon_home.svg",
          ),
          _buildNavigationBarItem(
            "notification".tr,
            MainTabs.notifcation == controller.currentTab.value ? "icon_notification.svg" : "icon_notification.svg",
          ),
          _buildNavigationBarItem(
            "Me",
            MainTabs.profile == controller.currentTab.value ? "icon_profile_activited.svg" : "icon_profile.svg",
          )
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorConstants.black,
        currentIndex: controller.getCurrentIndex(controller.currentTab.value),
        selectedItemColor: ColorConstants.black,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) => controller.switchTab(index),
      ),
    );
  }

  Widget _buildContent(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return controller.homeTab;
      case MainTabs.notifcation:
        return controller.notificationTab;
      case MainTabs.profile:
        return controller.profileTab;
      default:
        return controller.homeTab;
    }
  }

  BottomNavigationBarItem _buildNavigationBarItem(String label, String svg) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/svgs/$svg',
        width: 20,
      ),
      label: label,
    );
  }
}
