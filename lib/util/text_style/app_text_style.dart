

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';

class AppTextStyle {
  static TextStyle style({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    double height = 1.3,
    TextDecoration decoration = TextDecoration.none,
    Color? decorationColor,
    double? decorationThickness,
    TextAlign? textAlign,
  }) {
    return TextStyle(
      fontFamily: 'Figtree',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor ?? color,
      decorationThickness: decorationThickness,
    );
  }

  // Ready-made styles
  static TextStyle heading34({
    FontWeight fontWeight = FontWeight.w700,
    Color color = Colors.black,
  }) =>
      style(fontSize: 34.sp, fontWeight: fontWeight, color: color);

  static TextStyle title24({
    FontWeight fontWeight = FontWeight.w600,
    Color color = Colors.black,
  }) =>
      style(fontSize: 24.sp, fontWeight: fontWeight, color: color);

  static TextStyle title18({
    FontWeight fontWeight = FontWeight.w500,
    Color color = AppColors.textColor,
  }) =>
      style(fontSize: 18.sp, fontWeight: fontWeight, color: color);

  static TextStyle body16({
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      style(fontSize: 16.sp, fontWeight: fontWeight, color: color);

  static TextStyle body14({
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.textColor,
  }) =>
      style(fontSize: 14.sp, fontWeight: fontWeight, color: color);

  // Optional SemiBold shortcut
  static TextStyle body16SemiBold({
    Color color = Colors.black,}) =>
      style(fontSize: 16.sp, fontWeight: FontWeight.w500, color: color);
}
