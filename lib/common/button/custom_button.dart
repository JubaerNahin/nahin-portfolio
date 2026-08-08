import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../util/app_colors/app_colors.dart';
import '../../util/text_style/app_text_style.dart';


class CustomAuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double height;
  final double borderRadius;
  final double width;
  final double fontSize;
  final Color color;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final bool showIcon;
  final Widget? icon;
  final TextStyle? textStyle;
  final double elevation;

  const CustomAuthButton({
    super.key,
    required this.title,
    required this.onTap,
    this.textColor,
    this.fontSize = 16,
    this.height = 52,
    this.width = double.infinity,
    this.borderRadius = 30,
    this.color = AppColors.primaryColor,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    this.showIcon = true,
    this.icon,
    this.textStyle,
    this.elevation = 2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          padding: padding,
        ),
        child:  Center(
          child: Text(
            title,
            style: textStyle ??
                AppTextStyle.style(
                  color: textColor?? Colors.white,
                  fontSize: fontSize.sp,
                ),
          ),
        ),
      ),
    );
  }
}
