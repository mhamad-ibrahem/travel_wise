import 'package:dio/dio.dart';
import '../classes/dio_response.dart';
import '../../config/classes/status_request.dart';
import '../../helpers/log_helper/log_helper.dart';
import 'handle_errors_by_exceprions.dart';
import 'handle_errors_by_status_code.dart';

class DioExceptions {
  static ApiResponse showDioExceptionMessage({
    required DioException dioException,
  }) {
    ApiResponse dioResponse =
        ApiResponse(responseData: '', statusRequest: StatusRequest.failure);
    LogHelper.logError("error is ${dioException.response}");
    LogHelper.logError("status code is ${dioException.response?.statusCode}");

    if (dioException.response?.statusCode != null) {
      dioResponse = HandleErrorsByStatusCode.handleErrors(dioException);
    } else {
      dioResponse = HandleApiErrorsByExceptions.handleApiErrors(dioException);
    }
    return dioResponse;
  }
}
