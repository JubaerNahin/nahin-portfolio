import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../base_response/api_response.dart';

class ApiErrorHandler {

  static ApiResponse getErrorResponse({
    required dynamic error,
    bool isBinaryResponse = false,
  }) {
    String errorDescription = "Unknown error occurred";

    if (isBinaryResponse) {
      return ApiResponse(
        response: null,
        message: "Binary response error. Please try later.",
      );
    }

    if (error is Exception) {
      if (error is DioException) {
        if (kDebugMode) {
          print("DioException: ${error.error}");
          print("Response: ${error.response}");
          print("Message: ${error.message}");
          print("ResponseType: ${error.requestOptions.responseType}");
          print("Type: ${error.type}");
        }

        switch (error.type) {
          case DioExceptionType.cancel:
            errorDescription = "Request to server was cancelled";
            break;
          case DioExceptionType.connectionTimeout:
            errorDescription = "Connection timeout with server";
            break;
          case DioExceptionType.receiveTimeout:
            errorDescription = "Receive timeout in connection with server";
            break;
          case DioExceptionType.unknown:
            errorDescription = "Failed to connect. Please check your internet connection.";
            break;
          case DioExceptionType.badResponse:
            if (error.response != null) {
              switch (error.response!.statusCode) {
                case 400:
                  errorDescription = getErrorMessage(error.response!.data);
                  break;

                case 401:
                  errorDescription = getErrorMessage(error.response!.data);
                  if (kDebugMode) {
                    print("401 Error Description: $errorDescription");
                  }
                  break;


                case 404:
                  errorDescription = "No data found";
                  break;

                case 406:
                  errorDescription = getErrorMessage(error.response!.data);
                  break;

                case 422:
                  errorDescription = getErrorMessage(error.response!.data);
                  break;

                case 500:
                  errorDescription = getErrorMessage(error.response!.data);
                  break;

                case 503:
                  errorDescription = getErrorMessage(error.response!.data);
                  break;

                default:
                  errorDescription = "Something went wrong";
                  break;

              }
            } else {
              errorDescription = "Invalid server response";
            }
            break;
          default:
            errorDescription = "Unknown error occurred";
            break;
        }

        return ApiResponse(
          response: error.response,
          message: errorDescription,
        );
      }
    }

    return ApiResponse(
      response: null,
      message: errorDescription,
    );
  }

  // static String getErrorMessage(dynamic data) {
  //   if (data is Map && data.containsKey("message")) {
  //     return data["message"].toString();
  //   } else if (data is Map && data.containsKey("error")) {
  //     return data["error"].toString();
  //   }
  //   return "Unknown error occurred";
  // }



  static String getErrorMessage(dynamic data) {
    if (data is Map) {
      // Laravel-style validation errors
      if (data.containsKey('errors') && data['errors'] is Map) {
        final errors = data['errors'] as Map;

        // Get first field error
        final firstError = errors.values.first;
        if (firstError is List && firstError.isNotEmpty) {
          return firstError.first.toString();
        }
      }

      // Fallback message
      if (data.containsKey("message")) {
        return data["message"].toString();
      }

      if (data.containsKey("error")) {
        return data["error"].toString();
      }
    }

    return "Unknown error occurred";
  }


}