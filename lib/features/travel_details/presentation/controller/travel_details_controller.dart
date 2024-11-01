import 'package:get/get.dart';
import 'package:travel_wise/core/api/classes/dio_response.dart';
import 'package:travel_wise/core/config/classes/status_request.dart';
import 'package:travel_wise/core/routes/constant/app_route_arguments_name.dart';
import 'package:travel_wise/core/services/app_services.dart';
import 'package:travel_wise/features/home/presentation/controller/home_controller.dart';
import 'package:travel_wise/shared/widgets/loading/loading_dialog.dart';
import 'package:travel_wise/shared/widgets/toast/cherry_toast.dart';
import '../../../home/data/model/trips_model.dart';
import '../../data/model/book_model.dart';
import '../../domain/use_case/book_trip_use_case.dart';

class TravelDetailsController extends GetxController {
  final BookTripUseCase bookTripUseCase;
  TravelDetailsController({required this.bookTripUseCase});
  int numberOfTickets = 0;
  final TripsModel? tripsModel = Get.arguments[AppRoutesArgumentsName.model];

  void bookTrip() async {
    if (numberOfTickets > 0) {
        showLoadingDialog();
        ApiResponse response = await bookTripUseCase.execute(BookModel(
          numberOfTickets: numberOfTickets,
          tripId: tripsModel!.id,
          userId: AppServices.localUserData!.id,
        ));
        Get.back();
        if (response.statusRequest == StatusRequest.dataLoaded) {
          HomeController homeController = Get.find();
          Get.back();
          AppCherryToast.showSuccessToast(message: 'Booked successfully');
          homeController.getData();
          numberOfTickets = 0;
          update();
        }
    } else {
      AppCherryToast.showErrorToast(errorMessage: 'Add number of tickets');
    }
  }
}
