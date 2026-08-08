import 'package:get/get.dart';
import 'package:nahin_portfolio/features/auth/data/repo/auth_repo.dart';
import '../../../core/network/remote/dio/dio_client.dart';
import '../../../util/helper/sharepreference_class.dart';

class LoginController extends GetxController {
  DioClient dioClient;
  AuthRepo authRepo;
  final SharedPreferencesClass sharedPreferencesClass;

  LoginController({
    required this.authRepo,
    required this.dioClient,
    required this.sharedPreferencesClass,
  });

  var isLoginLoading = false.obs;
  var isChecked = false.obs;
  var isPasswordHidden = true.obs;

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Future<bool> signInInfo(String email, String password, BuildContext context) async {
  //   isLoginLoading.value = true;
  //
  //   try {
  //     final data = {
  //       "email": email.toString(),
  //       "password": password.toString()
  //     };
  //     final apiResponse = await authRepo.signInData(data);
  //     if (kDebugMode) {
  //       print("API Response: ${apiResponse.message}");
  //     }
  //
  //     if (apiResponse.response == null) {
  //       Get.snackbar('Error', apiResponse.message ?? 'Server connection failed');
  //       return false;
  //     }
  //
  //     final responseData = apiResponse.response!.data;
  //     if (apiResponse.response!.statusCode == 200 && responseData["token"] != null) {
  //       final token = responseData["token"].toString();
  //       final userId = responseData["data"]["id"].toString();
  //       final profileType = responseData["data"]["profile_type"].toString();
  //       final kycUploadStatus = responseData["data"]["upload_status"].toString();
  //       final verifyStatus = responseData["data"]["verify_status"].toString();
  //       final skillStatus = responseData["data"]["skills_added"].toString();
  //
  //
  //       await SharedPreferencesClass.setValue(AppConstants.profileType, profileType);
  //       await SharedPreferencesClass.setValue(AppConstants.token, token);
  //       await SharedPreferencesClass.setValue(AppConstants.userId, userId);
  //
  //       if (isChecked.value) {
  //         await SharedPreferencesClass.setValue('saved_email', email);
  //         await SharedPreferencesClass.setValue('saved_password', password);
  //         await SharedPreferencesClass.setBoolValue('remember_me', true);
  //       }
  //
  //       await dioClient.updateHeader();
  //
  //       final checkToken =  await SharedPreferencesClass.getValue(AppConstants.token);
  //       final userType = await SharedPreferencesClass.getValue(AppConstants.profileType);
  //       final checkId = await SharedPreferencesClass.getValue(AppConstants.userId);
  //
  //
  //       if (kDebugMode) {
  //         print('=======================================login controller id:$checkId');
  //         print('=======================================login controller userType:$userType');
  //         print('=======================================login controller token:$checkToken');
  //         print('=======================================login controller kycUploadStatus:$kycUploadStatus');
  //         print('=======================================login controller verifyStatus:$verifyStatus');
  //         print('=======================================login controller skill added?:$skillStatus');
  //       }
  //
  //       if(userType.toString() == "contractor"){
  //         if(kycUploadStatus.toString() == "not_uploaded") {
  //           Get.toNamed(VerifyYourIdentityScreen.routeName);
  //         } else if(verifyStatus.toString() == "verified") {
  //           await SharedPreferencesClass.setValue(AppConstants.isLogIn, "contractorLoggedIn");
  //
  //           if(skillStatus == "skills not added") {
  //             Get.toNamed(SetSkillScreen.routeName);
  //           } else {
  //             Get.offNamed(ContractorBottomNavScreen.routeName);
  //           }
  //         } else if(verifyStatus.toString() == "not_verified") {
  //           Get.offNamed(VerificationUnderReview.routeName);
  //         } else if(verifyStatus.toString() == "rejected") {
  //           Get.offNamed(VerificationUnderReview.routeName);
  //         }
  //
  //       }else if(userType == "customer"){
  //         await SharedPreferencesClass.setValue(AppConstants.isLogIn, "customerLoggedIn");
  //         Get.offNamed(UserBottomNavScreen.routeName);
  //       }
  //       return true;
  //     }
  //
  //     final errorMessage = responseData["message"] ?? "Login failed";
  //     if (kDebugMode) {
  //       print( "error is ======== $errorMessage");
  //     }
  //     //Get.snackbar('Error', errorMessage,);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage), ));
  //
  //     return false;
  //   } catch (e, stackTrace) {
  //     if (kDebugMode) {
  //       print("Login Error: $e\n$stackTrace");
  //     }
  //     Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
  //     return false;
  //   } finally {
  //     isLoginLoading.value = false;
  //   }
  // }
}
