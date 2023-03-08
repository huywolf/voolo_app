import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/constants/assets.dart';

class SuccessAlertDialog extends StatelessWidget {
  const SuccessAlertDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.ICON_SUCCESS, height: 80),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: AppTextStyles.MEDIUM_FS,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),
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
