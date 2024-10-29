import 'package:get/get.dart';
import '../../../../../core/api/classes/dio_response.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../core/helpers/log_helper/log_helper.dart';
import '../../../../../shared/data/model/local_user_data_model.dart';
import '../../../../../shared/widgets/toast/cherry_toast.dart';
import '../../domain/repo/login_repo.dart';
import '../data_source/login_data_source.dart';
import '../model/login_model.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<ApiResponse> login({required LoginModel loginModel}) async {
    ApiResponse data = await LoginApi.login(loginModel.toJson()).request();
    LogHelper.logCyan("status code is ${data.statusCode}");
    if (data.statusRequest == StatusRequest.dataLoaded) {
      LogHelper.logSuccess("data is ${data.responseData}");
      LocalUserData user = LocalUserData.fromJson(data.responseData);
      return ApiResponse(
        responseData: user,
        statusRequest: StatusRequest.dataLoaded,
      );
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
