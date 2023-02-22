import 'package:flutter/material.dart';
import 'package:voolo_app/shared/constants/colors.dart';

class AppTextButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const AppTextButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.bgColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: textColor ?? ColorConstants.primary,
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w700,
      ),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.transparent,
        child: Text(
          text ?? '',
        ),
      ),
    );
  }
}
