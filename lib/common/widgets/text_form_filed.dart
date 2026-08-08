


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/app_colors/app_colors.dart';
import '../../util/text_style/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final bool isPasswordFiled;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.obscureText = false,
    this.onToggleVisibility,
    this.isPasswordFiled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      obscureText: isPasswordFiled ? obscureText : false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.body14(color: AppColors.ashGray),

        // prefix icon
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 20.sp, color: AppColors.ashGray)
            : null,

        // suffix icon logic
        suffixIcon: isPasswordFiled
            ? IconButton(
          onPressed: onToggleVisibility,
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            size: 20.sp,
            color: AppColors.ashGray,
          ),
        )
            : Icon(
          Icons.mail, // <-- always mail for non-password
          size: 20.sp,
          color: AppColors.ashGray,
        ),

        // outline borders
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: AppColors.ashGray,width: 0.2),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: AppColors.btnColor, width: 1.w),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}
