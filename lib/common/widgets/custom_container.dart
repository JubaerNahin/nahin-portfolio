import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? backgroundColor;
  final BoxShadow? boxShadow;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;

  const CustomContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.color,
    this.backgroundColor,
    this.boxShadow,
    this.margin,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor ?? color ?? Colors.transparent,
        border: Border.all(
          width: borderWidth ?? 1.h,
          color: borderColor ?? const Color(0xffDFE3E8),
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        boxShadow: boxShadow != null ? [boxShadow!] : null,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(16.r),
        child: child,
      ),
    );
  }
}
