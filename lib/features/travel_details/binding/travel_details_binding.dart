import 'package:get/get.dart';

import '../data/repo_impl/travel_details_repo_impl.dart';
import '../domain/repo/travel_details_repo.dart';
import '../domain/use_case/book_trip_use_case.dart';
import '../presentation/controller/travel_details_controller.dart';

class TravelDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TravelDetailsRepoImpl());
    TravelDetailsRepo travelDetailsRepo = Get.find<TravelDetailsRepoImpl>();
    Get.put(BookTripUseCase(travelDetailsRepo));
    Get.put(TravelDetailsController(bookTripUseCase: Get.find()));
  }
}
