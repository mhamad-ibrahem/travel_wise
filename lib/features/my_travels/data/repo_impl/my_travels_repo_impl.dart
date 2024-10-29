import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travel_wise/features/home/data/model/trips_model.dart';
import '../../../../../core/api/classes/dio_response.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../core/helpers/log_helper/log_helper.dart';
import '../../../../../shared/widgets/toast/cherry_toast.dart';
import '../../domain/repo/my_travels_repo.dart';
import '../data_source/my_travels_data_source.dart';

class MyTravelsRepoImpl extends MyTravelsRepo {
  @override
  Future<ApiResponse> getData(CancelToken cancelToken) async {
    ApiResponse response = await MyTravelsDataSource.getMyTravelsData().request();
    LogHelper.logCyan("status code is ${response.statusCode}");
    if (response.statusRequest == StatusRequest.dataLoaded) {
      LogHelper.logSuccess("date is ${response.responseData}");
      List responseData = response.responseData['data'];
      List<TripsModel> trips =
          responseData.map((e) => TripsModel.fromJson(e)).toList();
      return ApiResponse(
        responseData: trips,
        statusRequest: StatusRequest.none,
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
