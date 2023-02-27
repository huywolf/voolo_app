import 'package:flutter/material.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/routes/routes.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';

class AccountTab extends GetView<HomeController> {
  const AccountTab({super.key});

  void showUpdateLanguage() {
    Get.defaultDialog(
        title: "update_locale".tr,
        titleStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        cancelTextColor: Colors.black,
        confirmTextColor: Colors.white,
        barrierDismissible: true,
        radius: 12,
        titlePadding: const EdgeInsets.only(top: 20),
        contentPadding: const EdgeInsets.all(20),
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
      decoration: const BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            AccountItem(
              icon: const Icon(Icons.person, size: 25),
              title: "voolo_account".tr,
              onTap: () => Get.toNamed(Routes.VERIFY_BNPL),
            ),
            AccountItem(
              icon: const Icon(Icons.language, size: 25),
              title: "update_locale".tr,
              onTap: showUpdateLanguage,
            ),
            AccountItem(
              icon: const Icon(Icons.logout, size: 25),
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
