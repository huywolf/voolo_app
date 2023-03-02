import 'package:flutter/material.dart';
import 'package:voolo_app/shared/constants/colors.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonBgColor;
  final Color? disableButtonBgColor;
  final bool loading;
  final bool disabled;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? radius;
  final TextStyle? textStyle;
  final TextStyle? disableTextStyle;
  final BorderSide? borderSide;
  final double? elevation;

  const AppElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonBgColor,
    this.disableButtonBgColor,
    this.disabled = false,
    this.loading = false,
    this.buttonHeight,
    this.buttonWidth,
    this.radius,
    this.textStyle,
    this.disableTextStyle,
    this.borderSide,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: buttonHeight ?? 50,
      padding: EdgeInsets.zero,
      elevation: elevation,
      onPressed: disabled ? null : onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
        side: borderSide ?? BorderSide.none,
      ),
      color: buttonBgColor ?? ColorConstants.PRIMARY,
      disabledColor: disableButtonBgColor ?? const Color(0xffBABABA),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          disabled
              ? Text(
                  text,
                  style: disableTextStyle ?? const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                )
              : Text(
                  text,
                  style: textStyle ?? const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
          buildLoading(Colors.white)
        ],
      ),
    );
  }

  Widget buildLoading(Color color) {
    if (!loading) return Container();
    return Row(
      children: [
        const SizedBox(width: 10),
        SizedBox(
          width: 14,
          height: 14,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            color: color,
          ),
        )
      ],
    );
  }
}
