import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../config/classes/status_request.dart';
import '../classes/dio_response.dart';

class HandleErrorsByStatusCode {
  static ApiResponse handleErrors(DioException dioException) {
    if (dioException.response?.statusCode == 400) {
      return ApiResponse(
          statusCode: 400,
          responseData: '',
          errorMessage: dioException.response?.data['message'],
          statusRequest: StatusRequest.failure);
    } else if (dioException.response?.statusCode == 401) {
      return ApiResponse(
          statusCode: 401,
          responseData: '',
          errorMessage: "Un authorized".tr,
          statusRequest: StatusRequest.authorizedFailure);
    } else if (dioException.response?.statusCode == 403) {
      return ApiResponse(
          statusCode: 403,
          responseData: '',
          errorMessage:
              "Forbidden—you don't have permission to access this resource".tr,
          statusRequest: StatusRequest.forbiddenFailure);
    } else if (dioException.response?.statusCode == 500) {
      return ApiResponse(
          statusCode: 500,
          responseData: '',
          errorMessage: 'Server error'.tr,
          statusRequest: StatusRequest.internalServerError);
    } else if (dioException.response?.statusCode == 404) {
      return ApiResponse(
          statusCode: 404,
          responseData: '',
          errorMessage: 'Not found'.tr,
          statusRequest: StatusRequest.failure);
    } else {
      final Map<String, dynamic> map = {};
      return ApiResponse(
          statusCode: dioException.response?.statusCode,
          responseData: '',
          errorMessage: dioException.response?.data != null
              ? dioException.response?.data.runtimeType== map.runtimeType  ? dioException.response?.data['message'].toString()
              : 'Un know error': 'Un know error',
          statusRequest: StatusRequest.failure);
    }
  }
}
