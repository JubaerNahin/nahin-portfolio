import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/app_colors/app_colors.dart';
import '../../../../util/text_style/app_text_style.dart';


class LogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const LogoutDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: EdgeInsets.all(16),
      content: SizedBox(
        height: 170.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Log out?".tr,
                  style: AppTextStyle.title18().copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.c25221F
                  ),),
                SizedBox(height: 8.h),
                Text("Are you sure want to Logout from your account?".tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.title18().copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff637381)
                  ),)
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onCancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE0E0E0), // Grey background
                      foregroundColor: Colors.black, // Black text
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:  Text(
                      "Cancel".tr,
                      style: AppTextStyle.title18().copyWith(
                        color: Color(0xff514E4C),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Red background
                      foregroundColor: Colors.white, // White text
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:  Text(
                      "Confirm".tr,
                      style: AppTextStyle.title18().copyWith(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
