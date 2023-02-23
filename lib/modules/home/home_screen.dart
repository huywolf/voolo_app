import 'package:flutter/material.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/shared/shared.dart';
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
          _buildNavigationBarItem('home'.tr, Icons.home, MainTabs.home),
          _buildNavigationBarItem("history".tr, Icons.history, MainTabs.notifcation),
          _buildNavigationBarItem("profile".tr, Icons.account_circle_outlined, MainTabs.profile)
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorConstants.black,
        selectedItemColor: ColorConstants.black,
        selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        currentIndex: controller.getCurrentIndex(controller.currentTab.value),
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

  BottomNavigationBarItem _buildNavigationBarItem(String label, IconData iconData, MainTabs currentTab) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        size: 25,
        color: currentTab == controller.currentTab.value ? Colors.purple : null,
      ),
      label: label,
    );
  }
}
