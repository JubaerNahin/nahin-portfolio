import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nahin_portfolio/util/app_colors/app_colors.dart';
import 'package:nahin_portfolio/util/app_images/app_images.dart';
import '../../../../util/text_style/app_text_style.dart';

class NormalAppBar extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  const NormalAppBar({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20.w,
            ),
            GestureDetector(
                onTap: onTap ??
                    () {
                      // if (Get.isSnackbarOpen) {
                      //   Get.closeAllSnackbars();
                      // }

                      Navigator.pop(context);
                    },
                child: SvgPicture.asset(
                  AppImages.arrowLeft,
                  height: 24.h,
                  width: 24.w,
                )),
            SizedBox(
              width: 6.w,
            ),
            Text(
              title,
              style: AppTextStyle.style(
                  color: AppColors.textColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          height: 1.h,
          width: double.infinity,
          color: Color(0xffF2F2F2),
        )
      ],
    );
  }
}
