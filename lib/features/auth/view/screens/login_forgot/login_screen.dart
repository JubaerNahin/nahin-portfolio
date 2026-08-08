import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nahin_portfolio/common/button/custom_elevated_button.dart';
import 'package:nahin_portfolio/common/widgets/cutstom_text_field2.dart';
import 'package:nahin_portfolio/features/auth/controller/login_controller.dart';
import 'package:nahin_portfolio/util/app_colors/app_colors.dart';
import 'package:nahin_portfolio/util/app_images/app_images.dart';
import 'package:nahin_portfolio/util/text_style/app_text_style.dart';

class LoginScreen extends GetView<LoginController> {
  static const String routeName = '/login';
  LoginScreen({super.key});

  //final LoginController controller = Get.find<LoginController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final GetStorage box = GetStorage();

  /// Toggle Language Function
  void toggleLanguage() {
    String currentLang = box.read('app_language') ?? 'en';
    if (currentLang == 'en') {
      box.write('app_language', 'es');
      Get.updateLocale(const Locale('es'));
    } else {
      box.write('app_language', 'en');
      Get.updateLocale(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentLang = box.read('app_language') ?? 'en';

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// SCROLLABLE FORM
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.h),

                        /// LANGUAGE TOGGLE
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: toggleLanguage,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  currentLang == 'en' ? "English" : "Español",
                                  style: AppTextStyle.style(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16.h),

                        Image.asset(
                          AppImages.splashLogo,
                          height: 80.h,
                          width: 80.h,
                        ),

                        SizedBox(height: 16.h),

                        Text(
                          "Hi, Welcome Back!".tr,
                          style: AppTextStyle.style(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColor),
                        ),

                        Text(
                          "Sign in to continue".tr,
                          style: AppTextStyle.style(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor),
                        ),

                        SizedBox(height: 60.h),

                        /// EMAIL
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Email address".tr,
                              style: AppTextStyle.style(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          height: 48.h,
                          controller: emailController,
                          hintText: "Enter your email address".tr,
                          leftIcon: SvgPicture.asset(
                            AppImages.fieldMail,
                            height: 20.h,
                            width: 20.w,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter an email".tr;
                            } else if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                .hasMatch(value)) {
                              return "Please enter a valid email".tr;
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 16.h),

                        /// PASSWORD
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Password".tr,
                              style: AppTextStyle.style(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Obx(
                          () => CustomTextField(
                            height: 48.h,
                            obscureText: controller.isPasswordHidden.value,
                            toggleVisibility:
                                controller.togglePasswordVisibility,
                            isPassword: true,
                            controller: passwordController,
                            hintText: "Enter your password".tr,
                            leftIcon: SvgPicture.asset(
                              AppImages.fieldLock,
                              height: 20.h,
                              width: 20.w,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password".tr;
                              } else if (value.length < 8) {
                                return "Password must be at least 8 characters"
                                    .tr;
                              }
                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 10.h),

                        /// REMEMBER ME & FORGOT PASSWORD
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: controller.toggleCheckbox,
                              child: Row(
                                children: [
                                  Obx(
                                    () => Container(
                                      width: 16.w,
                                      height: 16.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.c979797,
                                          width: 1.w,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: controller.isChecked.value
                                            ? AppColors.primaryColor
                                            : AppColors.whiteColor,
                                      ),
                                      child: controller.isChecked.value
                                          ? Icon(Icons.check,
                                              size: 12.w, color: Colors.white)
                                          : null,
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    'Remember me'.tr,
                                    style: AppTextStyle.style(
                                        color: AppColors.textColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //Get.toNamed(ForgotPassScreen.routeName);
                              },
                              child: Text(
                                'Forgot Password'.tr,
                                style: AppTextStyle.style(
                                    decoration: TextDecoration.underline,
                                    color: const Color(0xffFF4842),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 32.h),

                        /// SIGN IN BUTTON
                        Obx(() {
                          return CustomElevatedButton(
                            child: controller.isLoginLoading.value
                                ? SizedBox(
                                    height: 20.h,
                                    width: 20.w,
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    "Sign In".tr,
                                    style: AppTextStyle.style(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor),
                                  ),
                            onPressed: () async {},
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),

              /// CREATE ACCOUNT LINK
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? '.tr,
                    style: AppTextStyle.style(
                        color: AppColors.textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Create account'.tr,
                      style: AppTextStyle.style(
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
