import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voolo_app/modules/verify_bnpl/verify_bnpl_controller.dart';
import 'package:voolo_app/shared/utils/utils.dart';

class VerifyBnplScreen extends GetView<VerifyBnplController> {
  const VerifyBnplScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.vooloAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Số điện thoại: ${controller.phoneNumber}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
