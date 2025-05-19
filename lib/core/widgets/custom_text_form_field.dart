import 'package:flutter/material.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.validate,
    this.obscure = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSaved,
    this.controller,
    this.fillColor,
    this.borderColor,
    this.hintStyle,
    this.textColor,
  });

  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validate;
  final bool obscure;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String?)? onSaved;
  final TextEditingController? controller;

  // New optional color & style parameters:
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validate,
      obscureText: obscure,
      style: AppStyles.font14Medium.copyWith(
        color: textColor ?? Colors.black87,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ??
            AppStyles.font14Medium.copyWith(
              color: const Color(0xffC2C2C2),
            ),
        fillColor: fillColor ?? AppColors.grayColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor ?? AppColors.deepGrayColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor ?? AppColors.deepGrayColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor ?? AppColors.deepGrayColor),
        ),
      ),
    );
  }
}
