import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travel_wise/features/my_travels/domain/use_case/get_my_travels_data_use_case.dart';

import '../../../../core/api/classes/dio_response.dart';
import '../../../../core/config/classes/status_request.dart';

class MyTravelsController extends GetxController {
  final GetMyTravelsDataUseCase getMyTravelsDataUseCase;
  MyTravelsController({required this.getMyTravelsDataUseCase});
  StatusRequest statusRequest = StatusRequest.none;
  String errorMessage = '';
  CancelToken cancelToken = CancelToken();
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    ApiResponse response = await getMyTravelsDataUseCase.execute(cancelToken);
    statusRequest = response.statusRequest;
    update();
    if (statusRequest == StatusRequest.dataLoaded) {
    } else {
      errorMessage = response.errorMessage ?? '';
      update();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
