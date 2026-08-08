import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/base_response/api_response.dart';
import '../../../../core/network/remote/dio/dio_client.dart';
import '../../../../core/network/remote/exception/api_error_handler.dart';
import '../../../../util/app_constants/app_constants.dart';
import '../../../../util/helper/sharepreference_class.dart';

class AuthRepo{

  DioClient dioClient;
  final SharedPreferencesClass sharedPreferencesClass;
  AuthRepo({required this.dioClient,required this.sharedPreferencesClass});


  /// for sign in
  Future<ApiResponse> signInData(var data) async {
    try {
      Response response = await dioClient.post(
        AppConstants.baseUrl+AppConstants.signIn,
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }


  /// for sign up
  Future<ApiResponse> signUpData(var data) async {
    try {
      Response response = await dioClient.post(
        AppConstants.baseUrl+AppConstants.signUp,
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }


  /// sign up otp verify
  Future<ApiResponse> signUpOtpVerify(var data) async {
    try {
      Response response = await dioClient.post(
        AppConstants.baseUrl+AppConstants.signUpOtp,
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }

  /// forgot pass
  Future<ApiResponse> forgotPass(var data) async {
    try {
      Response response = await dioClient.post(
        AppConstants.baseUrl+AppConstants.forgotPass,
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }

  /// forgot otp verify
  Future<ApiResponse> forgotOtpVerify(var data) async {
    try {
      Response response = await dioClient.post(
        AppConstants.baseUrl+AppConstants.forgotPassOtp,
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }


  /// reset pass
  Future<ApiResponse> resetPass(var data) async {
    try {
      Response response = await dioClient.post(
        AppConstants.baseUrl+AppConstants.resetPass,
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }


  /// upload kyc
  Future<ApiResponse> uploadKyc({
    XFile? front,
    XFile? back,
  }) async {

    try {
      // Prepare FormData
      FormData formData = FormData.fromMap({
        if (front != null)
          'id_front': await MultipartFile.fromFile(
            front.path,
            filename: front.path.split('/').last,
          ),
        if (back != null)
          'id_back': await MultipartFile.fromFile(
            back.path,
            filename: back.path.split('/').last,
          ),
      });

      Response response = await dioClient.post(
        AppConstants.baseUrl+AppConstants.kycUpload,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }

}

