import 'package:get/get.dart';
import 'package:travel_wise/core/api/classes/dio_response.dart';
import 'package:travel_wise/core/config/classes/status_request.dart';
import 'package:travel_wise/features/home/data/model/trips_model.dart';

import '../../domain/use_case/get_home_data_use_case.dart';

class HomeController extends GetxController {
  final GetHomeDataUseCase getHomeDataUseCase;
  HomeController({required this.getHomeDataUseCase});
  StatusRequest statusRequest = StatusRequest.none;
  String errorMessage = '';
  List<TripsModel>trips=[];
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    ApiResponse response = await getHomeDataUseCase.execute();
    statusRequest = response.statusRequest;
    update();
    if (statusRequest == StatusRequest.dataLoaded) {
      trips=response.responseData;
      update();
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
