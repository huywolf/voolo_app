import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';

import '../controller/bnpl_account_controller.dart';

class BnplAccountScreen extends GetView<BnplAccountController> {
  const BnplAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TK Mua trước trả sau", style: AppTextStyles.LARGE_BOLD),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Số điện thoại: ${controller.phoneNumber}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.step.value == 1) {
                return const Text("Bạn chưa có tài khoản BNPL");
              }
              return const Text("Số tài khoản này đã đăng ký BNPL");
            })
          ],
        ),
      ),
    );
  }
}
