import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../config/classes/status_request.dart';
import '../classes/dio_response.dart';

class HandleApiErrorsByExceptions {
  static ApiResponse handleApiErrors(DioException dioException) {
    if (dioException.message!.contains("401")) {
      return ApiResponse(
          responseData: '',
          errorMessage: "Un authorized".tr,
          statusRequest: StatusRequest.authorizedFailure);
    } else if (dioException.type == DioExceptionType.receiveTimeout) {
      return ApiResponse(
          responseData: '',
          errorMessage: 'Receive connection timeout'.tr,
          statusRequest: StatusRequest.timeOutFailure);
    } else if (dioException.type == DioExceptionType.connectionTimeout) {
      return ApiResponse(
          responseData: '',
          errorMessage: 'Request connection timeout'.tr,
          statusRequest: StatusRequest.timeOutFailure);
    } else if (dioException.type == DioExceptionType.sendTimeout) {
      return ApiResponse(
          responseData: '',
          errorMessage: 'Request connection timeout'.tr,
          statusRequest: StatusRequest.timeOutFailure);
    } else if (dioException.type == DioExceptionType.connectionError) {
      return ApiResponse(
          responseData: '',
          errorMessage: "Check internet connections or check api end point".tr,
          statusRequest: StatusRequest.offlineFailure);
    } else if (dioException.type == DioExceptionType.cancel) {
      return ApiResponse(
          responseData: '',
          errorMessage: 'Something went wrong try again'.tr,
          statusRequest: StatusRequest.failure);
    } else if (dioException.type == DioExceptionType.badResponse) {
      return ApiResponse(
          responseData: '',
          errorMessage: dioException.response?.data,
          statusRequest: StatusRequest.failure);
    } else if (dioException.type == DioExceptionType.unknown) {
      return ApiResponse(
          responseData: '',
          errorMessage: "Un know error".tr,
          statusRequest: StatusRequest.failure);
    } else {
      return ApiResponse(
          responseData: '',
          errorMessage: "Un know error".tr,
          statusRequest: StatusRequest.failure);
    }
  }
}
