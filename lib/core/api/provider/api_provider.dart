import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../config/app_config.dart';
import '../../config/classes/status_request.dart';
import '../../helpers/internet_functions/check_internet_connection.dart';
import '../../helpers/log_helper/log_helper.dart';
import '../classes/api_request.dart';
import '../classes/dio_response.dart';
import '../errors/dio_exceptions.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 30);
  final _client = Dio(BaseOptions(connectTimeout: requestTimeOut));
  static final _singleton = APIProvider();
  static APIProvider get instance => _singleton;

  Future<ApiResponse> request(APIRequest request) async {
    LogHelper.logCyan("Link is ${request.url}");
    LogHelper.logMagenta("method is ${request.method}");
    LogHelper.logCyan("body is ${request.body}");
    LogHelper.logCyan("query is ${request.query}");
    try {
      if (await checkInternetConnection()) {
        final response = await _client.request(
          request.url,
          options: Options(
            headers: request.isAuthorized == true
                ? AppConfig.authorizedHeaders
                : AppConfig.header,
            method: request.method.string,
            receiveTimeout: requestTimeOut,
            sendTimeout: requestTimeOut,
          ),
          cancelToken: request.cancelToken,
          queryParameters: request.query,
          data: request.body,
        );
        LogHelper.logCyan("status code is ${response.statusCode}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          return ApiResponse(
              responseData: response.data,
              statusRequest: StatusRequest.dataLoaded,
              statusCode: 200);
        } else {
          return ApiResponse(
              statusCode: 400,
              responseData: '',
              statusRequest: StatusRequest.failure,
              errorMessage: "Incorrect input");
        }
      } else {
        return ApiResponse(
          responseData: '',
          errorMessage: 'No internet connection',
          statusRequest: StatusRequest.offlineFailure,
        );
      }
    } on TimeoutException catch (_) {
      return ApiResponse(
        responseData: '',
        errorMessage: 'Receive connection timeout',
        statusRequest: StatusRequest.offlineFailure,
      );
    } on SocketException {
      return ApiResponse(
        responseData: [],
        errorMessage: 'No internet connection',
        statusRequest: StatusRequest.offlineFailure,
      );
    } on DioException catch (e) {
      LogHelper.logError("Dio exception error $e");
      return DioExceptions.showDioExceptionMessage(dioException: e);
    } on Exception catch (e) {
      LogHelper.logError("Catch error $e");
      return ApiResponse(
        responseData: [],
        errorMessage: "An Error Occurred ",
        statusRequest: StatusRequest.failure,
      );
    }
  }
}

// multi part request in dio
// final formData = FormData.fromMap({
//   'name': 'dio',
//   'date': DateTime.now().toIso8601String(),
//   'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
//   'files': [
//     await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
//     await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
//   ]
// });

//cancel request
// cancelToken.cancel();