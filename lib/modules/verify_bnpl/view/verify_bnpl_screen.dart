import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voolo_app/modules/verify_bnpl/controller/verify_bnpl_controller.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';

class VerifyBnplScreen extends GetView<VerifyBnplController> {
  const VerifyBnplScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TK Mua trước trả sau", style: AppTextStyles.largeBold),
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
