import 'package:flutter/material.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';

import '../shared.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final Gradient? gradient;
  final double width;
  final double height;
  final Function? onPressed;

  const GradientButton({
    Key? key,
    this.text = "",
    this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 64.0,
      decoration: BoxDecoration(
        gradient: gradient ??
            const LinearGradient(
              colors: <Color>[
                Color(0xff405FA3),
                Color(0xff1ED69D),
              ],
            ),
        borderRadius: BorderRadius.circular(22.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffE5F5FF),
            offset: Offset(0.0, 1.5),
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed as void Function()?,
          child: Center(
            child: text != ""
                ? Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: AppTextStyles.NORMAL_FS,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
