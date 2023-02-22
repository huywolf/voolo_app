import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voolo_app/shared/constants/app_textstyle.dart';
import 'package:voolo_app/shared/constants/colors.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.maxLength,
    this.maxLines,
    required this.onChanged,
    this.validateSuccess,
    this.isFocused,
    this.onTap,
    this.readOnly,
    this.inputFormatters,
    this.scrollPadding,
    this.enable,
    this.autoFocus,
    this.showClearIcon,
    this.fillColor,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;
  final ValueChanged<String> onChanged;
  final bool? validateSuccess;
  final bool? isFocused;
  final VoidCallback? onTap;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? scrollPadding;
  final bool? enable;
  final bool? autoFocus;
  final bool? showClearIcon;
  final Color? fillColor;

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

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.errorText != null
            ? ColorConstants.redError
            : widget.isFocused == true
                ? ColorConstants.primary
                : ColorConstants.greyBoder,
      ),
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
          style: TextStyle(color: Colors.black, fontSize: AppTextStyles.smallFS, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        TextFormField(
          inputFormatters: widget.inputFormatters,
          enabled: widget.enable,
          autofocus: widget.autoFocus ?? false,
          onTap: widget.onTap,
          onChanged: (value) {
            widget.onChanged.call(value);
          },
          scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
          controller: widget.controller,
          obscureText: obscureText ?? false,
          readOnly: widget.readOnly ?? false,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines ?? 1,
          keyboardType: widget.keyboardType,
          cursorColor: Colors.black,
          style: AppTextStyles.normalBold,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            filled: true,
            fillColor: Colors.white,
            errorMaxLines: 3,
            border: _buildOutlineInputBorder(),
            focusedBorder: _buildOutlineInputBorder(),
            enabledBorder: _buildOutlineInputBorder(),
            focusedErrorBorder: _buildOutlineInputBorder(),
            errorBorder: _buildOutlineInputBorder(),
            hintText: widget.hintText,
            errorText: widget.errorText,
            hintStyle: AppTextStyles.small.copyWith(color: ColorConstants.greyText),
            labelStyle: AppTextStyles.small.copyWith(color: ColorConstants.greyText),
            errorStyle: AppTextStyles.small.copyWith(color: Colors.red),
            suffixIconConstraints: BoxConstraints(minHeight: kIconPadding, minWidth: kIconPadding),
          ),
        ),
      ],
    );
  }
}
