import 'package:flutter/material.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/shared.dart';
import 'package:voolo_app/shared/widgets/buttons/app_elevated_button.dart';

class HomeTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppFocus.unfocus(context),
      child: Scaffold(
        appBar: CommonWidget.vooloAppBar(context),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: Dimension.scaffoldHorPadding),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Vui lòng nhập số điện thoại',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                AppElevatedButton(
                  onPressed: () async {},
                  radius: Dimension.kButtonRadius,
                  text: "Đăng ký",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
