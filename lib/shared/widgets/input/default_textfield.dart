import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/constants/assets.dart';
import 'package:voolo_app/shared/constants/colors.dart';

enum InputBorderType {
  focus,
  error,
}

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    Key? key,
    this.labelText,
    this.errorText,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.showVisibilityIcon = true,
    this.controller,
    this.readOnly,
    this.autoFocus,
    this.fillColor,
    this.validator,
    this.suffixEditIcon,
    this.extendSuffixWidget,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool showVisibilityIcon;
  final TextEditingController? controller;
  final bool? readOnly;
  final bool? autoFocus;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final Widget? suffixEditIcon;
  final Widget? extendSuffixWidget;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool? obscureText;
  final double kIconPadding = 16;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  OutlineInputBorder _buildOutlineInputBorder({InputBorderType? type}) {
    if (type == InputBorderType.focus) {
      return OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xff197DDE)),
        borderRadius: BorderRadius.circular(40),
      );
    }
    if (type == InputBorderType.error) {
      return OutlineInputBorder(
        borderSide: const BorderSide(color: ColorConstants.RED_ERROR),
        borderRadius: BorderRadius.circular(40),
      );
    }
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(40),
    );
  }

  Widget? buildSuffixIcon() {
    if (widget.obscureText && widget.showVisibilityIcon) {
      return GestureDetector(
        dragStartBehavior: DragStartBehavior.down,
        onTap: () {
          setState(() {
            obscureText = !obscureText!;
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kIconPadding),
          child: SizedBox(
            height: kIconPadding,
            width: kIconPadding,
            child: obscureText! ? Image.asset(Assets.VISIBILITY_OFF) : Image.asset(Assets.VISIBILITY),
          ),
        ),
      );
    }
    if (widget.suffixEditIcon != null) {
      return widget.suffixEditIcon;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText ?? "",
          style: const TextStyle(color: Colors.black, fontSize: AppTextStyles.SMALL_FS, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: _buildOutlineInputBorder(),
                  focusedBorder: _buildOutlineInputBorder(type: InputBorderType.focus),
                  enabledBorder: _buildOutlineInputBorder(),
                  focusedErrorBorder: _buildOutlineInputBorder(type: InputBorderType.error),
                  errorBorder: _buildOutlineInputBorder(type: InputBorderType.error),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: widget.hintText,
                  hintStyle: AppTextStyles.SMALL.copyWith(color: ColorConstants.GREY_TEXT),
                  errorText: widget.errorText,
                  errorMaxLines: 2,
                  suffixIcon: buildSuffixIcon(),
                ),
                cursorColor: const Color(0xff197DDE),
                readOnly: widget.readOnly ?? false,
                controller: widget.controller,
                style: AppTextStyles.NORMALBold,
                obscureText: obscureText ?? false,
                autocorrect: false,
                validator: widget.validator,
              ),
            ),
            if (widget.extendSuffixWidget != null)
              SizedBox(
                height: 50,
                child: widget.extendSuffixWidget!,
              )
          ],
        ),
      ],
    );
  }
}
