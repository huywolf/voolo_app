import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/constants/assets.dart';

class UnSuccessAlertDialog extends StatelessWidget {
  const UnSuccessAlertDialog({
    Key? key,
    this.title,
    required this.content,
  }) : super(key: key);

  final String? title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.ICON_UNSUCCESS, height: 80),
            const SizedBox(height: 20),
            if (title != null)
              Column(
                children: [
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: AppTextStyles.MEDIUM_FS,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            Text(
              content,
              style: const TextStyle(fontSize: AppTextStyles.SMALL_FS),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
