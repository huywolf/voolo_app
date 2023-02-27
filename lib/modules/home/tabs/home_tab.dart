import 'package:flutter/material.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/shared.dart';

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
          child: const Center(
            child: Text(
              "Trang chủ",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
