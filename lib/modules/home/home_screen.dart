import 'package:flutter/material.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

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
          _buildNavigationBarItem("account".tr, Icons.account_circle_outlined, MainTabs.account)
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorConstants.black,
        selectedItemColor: ColorConstants.black,
        selectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
        return controller.historyTab;
      case MainTabs.account:
        return controller.accountTab;
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
