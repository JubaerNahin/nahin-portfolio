


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/app_colors/app_colors.dart';
import '../../util/text_style/app_text_style.dart';


class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double height;
  final double width;
  final bool isSelected;
  final double selectedBorderRadius;
  final double unselectedBorderRadius;
  final bool isExistIcon;
  final String? iconPath;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 50,
    this.width = double.infinity,

    this.isSelected = false,
    this.selectedBorderRadius = 28,
    this.unselectedBorderRadius = 11,
    this.isExistIcon = false,
    this.iconPath
  });

  @override
  Widget build(BuildContext context) {


    final Color borderColor = isSelected
        ? AppColors.primaryGreenColor
        : AppColors.ashGray;

    final double effectiveBorderRadius = isSelected
        ? selectedBorderRadius.r
        : unselectedBorderRadius.r;

    return SizedBox(
      width: width,
      height: height.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor, width: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
          ),
        ),
        child: isExistIcon == false?Text(
          text,
          style: AppTextStyle.body14(),
        ):
        Row(
          children: [
            Image.asset(iconPath!),
            SizedBox(width: 16.w,),
            Text(
              text,
              style: AppTextStyle.body14(),
            )

          ],
        ),
      ),
    );
  }
}

