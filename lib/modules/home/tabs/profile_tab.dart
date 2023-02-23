import 'package:flutter/material.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';

class ProfileTab extends GetView<HomeController> {
  void showUpdateLanguage() {
    Get.defaultDialog(
        title: "update_locale".tr,
        titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        cancelTextColor: Colors.black,
        confirmTextColor: Colors.white,
        barrierDismissible: true,
        radius: 12,
        titlePadding: EdgeInsets.only(top: 20),
        contentPadding: EdgeInsets.all(20),
        content: Column(
          children: [
            AppElevatedButton(
              onPressed: () {
                Get.back();
                Get.updateLocale(Locale('vi', 'VN'));
              },
              text: "vietnamese".tr,
              radius: 10,
              buttonBgColor: Colors.black,
            ),
            const SizedBox(height: 12),
            AppElevatedButton(
              onPressed: () {
                Get.back();
                Get.updateLocale(Locale('en', 'US'));
              },
              text: "english".tr,
              radius: 10,
              buttonBgColor: Colors.black,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.vooloAppBar(context),
      body: _buildListItems(),
    );
  }

  Widget _buildListItems() {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ProfileItem(
              icon: Icon(Icons.language, size: 25),
              title: "update_locale".tr,
              onTap: showUpdateLanguage,
            ),
            ProfileItem(
              icon: Icon(Icons.logout, size: 25),
              title: "logout".tr,
              onTap: () {
                controller.signout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
