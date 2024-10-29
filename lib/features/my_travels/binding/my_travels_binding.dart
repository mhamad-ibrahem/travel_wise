import 'package:get/get.dart';
import 'package:travel_wise/features/my_travels/presentation/controller/my_travels_controller.dart';

import '../data/repo_impl/my_travels_repo_impl.dart';
import '../domain/repo/my_travels_repo.dart';
import '../domain/use_case/get_my_travels_data_use_case.dart';


class MyTravelsBinding {
 static void injection() {
    Get.put(MyTravelsRepoImpl());
    MyTravelsRepo myTravelsRepo = Get.find<MyTravelsRepoImpl>();
    Get.put(GetMyTravelsDataUseCase(myTravelsRepo));
    Get.put(MyTravelsController(getMyTravelsDataUseCase: Get.find()));
  }
}
