
import 'package:dio/dio.dart'as dio;
import 'package:get/get.dart';
import '../../../../../core/api/classes/dio_response.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../core/helpers/log_helper/log_helper.dart';
import '../../../../../shared/widgets/toast/cherry_toast.dart';
import '../../domain/repo/register_repo.dart';
import '../data_source/register_data_source.dart';
import '../model/register_model.dart';

class RegisterRepoImpl extends RegisterRepo {
  @override
  Future<ApiResponse> register({required RegisterModel model}) async {
     dio.FormData modelData =await  model.toJson();
    ApiResponse data = await RegisterDataSource.register(modelData).request();
    LogHelper.logCyan("status code is ${data.statusCode}");
    if (data.statusRequest == StatusRequest.dataLoaded) {
      // if (data.responseData['succeeded'] == true) {
      LogHelper.logSuccess("date is ${data.responseData}");
      // LocalUserData user = LocalUserData.fromJson(data.responseData["data"]);
      return ApiResponse(
        responseData: '',
        statusRequest: StatusRequest.dataLoaded,
      );
      // }
      // else {
      //   AppCherryToast.showErrorToast(errorMessage: data.responseData["messages"][0].toString().tr );
      //   return ApiResponse(
      //     responseData: null,
      //     errorMessage: data.errorMessage,
      //     statusCode: 400,
      //     statusRequest: StatusRequest.failure,
      //   );
      // }
    } else {
      AppCherryToast.showErrorToast(errorMessage: data.errorMessage?.tr ?? '');
      return ApiResponse(
        responseData: null,
        statusRequest: StatusRequest.failure,
        errorMessage: data.errorMessage,
        statusCode: data.statusCode,
      );
    }
  }
}
