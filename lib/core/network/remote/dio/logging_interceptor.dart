

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends InterceptorsWrapper{

  int maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    if (kDebugMode) {
      print("--> ${options.method} ${options.path}");
      print("Headers: ${options.headers.toString()}");
      print("<-- END HTTP");
    }

    return super.onRequest(options, handler);
  }


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    if (kDebugMode) {
      print("<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    }

    String responseAsString = response.data.toString();

    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        if (kDebugMode) {
          print(responseAsString.substring(i * maxCharactersPerLine, endingIndex));
        }
      }
    } else {
      if (kDebugMode) {
        print(response.data);
      }
    }

    if (kDebugMode) {
      print("<-- END HTTP");
    }

    return super.onResponse(response, handler);
  }


  @override
  void onError(DioException? err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    if (kDebugMode) {
      print("ERROR[${err!.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    }
    super.onError(err!, handler);
  }
}