import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voolo_app/modules/auth/view/widgets/blurry_container.dart';
import 'package:get/get.dart';

import '../controller/create_password_controller.dart';

class CreatePasswordScreen extends GetView<CreatePasswordController> {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const BlurryContainer(),
            Positioned(
              top: -40,
              right: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                child: const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
