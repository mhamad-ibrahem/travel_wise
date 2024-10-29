import 'package:get/get.dart';
import '../../../../../core/api/classes/dio_response.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../core/helpers/log_helper/log_helper.dart';
import '../../../../../shared/widgets/toast/cherry_toast.dart';
import '../../domain/repo/main_repo.dart';
import '../data_source/home_data_source.dart';
import '../model/user_model.dart';

class MainRepoImpl extends MainRepo {
  @override
  Future<ApiResponse> getData() async {
    ApiResponse response = await MainDataSource.getData().request();
    LogHelper.logCyan("status code is ${response.statusCode} statusRequest ${response.statusRequest}");
    if (response.statusRequest == StatusRequest.dataLoaded) {
      LogHelper.logSuccess("date is ${response.responseData}");
      UserModel responseData =
          UserModel.fromJson(response.responseData['data']);
      return ApiResponse(
        responseData: responseData,
        statusRequest: StatusRequest.dataLoaded,
      );
    } else {
      AppCherryToast.showErrorToast(
          errorMessage: response.errorMessage?.tr ?? '');
      return ApiResponse(
        responseData: null,
        statusRequest: StatusRequest.failure,
        errorMessage: response.errorMessage,
        statusCode: response.statusCode,
      );
    }
  }
}
