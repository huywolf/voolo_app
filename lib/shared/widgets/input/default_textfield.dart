import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/constants/colors.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    Key? key,
    this.labelText,
    this.errorText,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.readOnly,
    this.inputFormatters,
    this.enable,
    this.autoFocus,
    this.showClearIcon,
    this.fillColor,
    this.validator,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enable;
  final bool? autoFocus;
  final bool? showClearIcon;
  final Color? fillColor;
  final String? Function(String?)? validator;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool? obscureText;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstants.GREY_BODER),
      borderRadius: BorderRadius.circular(40),
    );
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
        const SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: _buildOutlineInputBorder(),
            focusedBorder: _buildOutlineInputBorder(),
            enabledBorder: _buildOutlineInputBorder(),
            focusedErrorBorder: _buildOutlineInputBorder(),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.hintText,
            hintStyle: AppTextStyles.SMALL.copyWith(color: ColorConstants.GREY_TEXT),
          ),
          cursorColor: Colors.black,
          controller: widget.controller,
          style: AppTextStyles.NORMALBold,
          obscureText: obscureText ?? false,
          autocorrect: false,
          validator: widget.validator,
        ),
      ],
    );
  }
}
