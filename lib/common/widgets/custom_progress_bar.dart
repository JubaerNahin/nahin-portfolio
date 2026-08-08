import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/app_colors/app_colors.dart';

class HomeProgressBar extends StatelessWidget {
  final dynamic completeValue; // Current progress value
  final dynamic mainValue;     // Maximum value (e.g., 12)
  final double height;
  final double width;
  final Color backgroundColor;
  final List<Color> progressColors;

  const HomeProgressBar({
    super.key,
    required this.completeValue,
    required this.mainValue,
    this.height = 12,
    this.width = 328,
    this.backgroundColor = const Color(0xFFcbcace),
    this.progressColors = const [
      AppColors.primaryColor,
      AppColors.primaryColor
    ],
  });

  @override
  Widget build(BuildContext context) {
    double progress = 0.0;

    // Safely calculate progress (between 0.0 and 1.0)
    if (mainValue != 0 &&
        mainValue != null &&
        completeValue != null &&
        completeValue is num &&
        mainValue is num) {
      progress = (completeValue / mainValue).clamp(0.0, 1.0);
    }

    return Container(
      width: width.w,
      height: height.h,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: progress,
          child: Container(
            height: height.h,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.0, 0.5),
                end: const Alignment(1.0, 0.5),
                colors: progressColors,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
