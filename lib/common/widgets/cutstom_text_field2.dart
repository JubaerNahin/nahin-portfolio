import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../util/app_colors/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? toggleVisibility;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? fieldColor;
  final double? textSize;
  final TextAlign? textAlign;
  final double? height;
  final GestureTapCallback? onTap;
  final bool read;
  final dynamic radius;
  final VoidCallback? onRightTap;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.leftIcon,
    this.rightIcon,
    this.isPassword = false,
    this.obscureText = false,
    this.toggleVisibility,
    this.radius = 10.0,
    this.validator,
    this.borderColor,
    this.fieldColor,
    this.textSize,
    this.textAlign = TextAlign.start,
    this.height = 46.0,
    this.read = false,
    this.onTap,
    this.onRightTap,this.inputType,
    this.onChanged, this.inputFormatters,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    final bool isLargeField = (widget.height ?? 52.h) > 100.h;

    return TextFormField(
      obscuringCharacter: "*",
      keyboardType:widget.inputType,
      controller: widget.controller,
      onChanged: widget.onChanged,
      readOnly: widget.read,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.isPassword && widget.obscureText,
      validator: widget.validator,
      style: TextStyle(
        color: Colors.black,
        fontSize: widget.textSize ?? 14.sp,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: Colors.black,
      textAlign: widget.textAlign ?? TextAlign.start,
      onTap: widget.onTap,
      maxLines: isLargeField ? null : 1,
      minLines: isLargeField ? 5 : 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fieldColor ?? Colors.transparent,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.c979797,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: widget.leftIcon != null
            ? Padding(
          padding: EdgeInsets.all(12.w),
          child: widget.leftIcon,
        )
            : null,
        suffixIcon: widget.isPassword
            ? GestureDetector(
          onTap: widget.toggleVisibility,
          child: Icon(
            widget.obscureText
                ? Icons.visibility_off
                : Icons.visibility,
            color: AppColors.c979797,
          ),
        )
            : (widget.rightIcon != null
            ? GestureDetector(
          onTap: widget.onRightTap,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: widget.rightIcon,
          ),
        )
            : null),
        contentPadding: isLargeField
            ? EdgeInsets.only(top: 12.h, left: 12.h, right: 12.w)
            : EdgeInsets.symmetric(
          vertical: ((widget.height ?? 46.h) / 2) - ((widget.textSize ?? 14.sp) / 1.5),
          horizontal: 16.w,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.borderColor ?? const Color(0xffF0F0F0),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.borderColor ?? const Color(0xffF0F0F0),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.borderColor ?? Color(0xff919191),
            width: 1.2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
        ),
      ),
    );
  }
}