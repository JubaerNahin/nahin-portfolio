import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../util/app_colors/app_colors.dart';
import '../../../../util/app_images/app_images.dart';
import '../../../../util/app_lotties/app_loties.dart';
import '../../../../util/text_style/app_text_style.dart';
import '../../controller/splash_controller.dart';
import 'package:lottie/lottie.dart';


 class SplashScreen extends StatelessWidget {

  static const String routeName = '/splash_screen';
   const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashController>();
    splashController.startTimer();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              Image.asset(AppImages.splashLogo, height: 110.h,width: 110.w,),
              SizedBox(height: 12.h,),
              Text(
                "ServiPro",
                style: AppTextStyle.style(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 208.h,),
              Column(
                children: [
                  Lottie.asset(
                    AppLotties.loadingLottie,
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(height: 32.h,),
                  Text(
                    "Version 1.0",
                    style: AppTextStyle.style(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff27322F),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35.h,),
            ],
          ),
        ),
      ),
    );
  }
}
