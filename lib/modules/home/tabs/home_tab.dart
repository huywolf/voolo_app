import 'package:flutter/material.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:get/get.dart';
import 'package:voolo_app/routes/routes.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';

class HomeTab extends GetView<HomeController> {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppFocus.unfocus(context),
      child: Scaffold(
        appBar: CommonWidget.vooloAppBar(context),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimension.scaffoldHorPadding),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                AppElevatedButton(
                  onPressed: () async {
                    Get.toNamed(Routes.VERIFY_BNPL);
                  },
                  radius: Dimension.kButtonRadius,
                  text: "Đăng ký BNPL",
                  buttonBgColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
