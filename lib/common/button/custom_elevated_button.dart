import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahin_portfolio/util/text_style/app_text_style.dart';
import '../../util/app_colors/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final BorderSide? borderSide;
  final dynamic height;
  final dynamic width;
  final dynamic radius;

  const CustomElevatedButton({
    super.key,
    this.text,
    required this.onPressed,
    this.backgroundColor,
    this.borderSide,
    this.textStyle,
    this.padding,
    this.height,
    this.width,
    this.radius = 8.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          overlayColor: Colors.white54,
          side: borderSide ?? BorderSide(color: Colors.transparent),
          elevation: 0.5,
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          padding:
              padding ?? EdgeInsets.symmetric(vertical: 13.h, horizontal: 55.w),
          shadowColor: Colors.white54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child ??
                Text(
                  text ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle ??
                      AppTextStyle.style(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor),
                ),
          ],
        ),
      ),
    );
  }
}
