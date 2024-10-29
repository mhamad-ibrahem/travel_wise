import 'package:get/get.dart';
import 'package:travel_wise/core/api/classes/dio_response.dart';
import 'package:travel_wise/core/config/classes/status_request.dart';
import 'package:travel_wise/core/routes/constant/app_route_arguments_name.dart';
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
      if (numberOfTickets <= (tripsModel!.minCapacity!)) {
        showLoadingDialog();
        ApiResponse response = await bookTripUseCase.execute(BookModel(
          numberOfTickets: numberOfTickets,
          tripId: 1,
          userId: 1,
        ));
        Get.back();
        if (response.statusRequest == StatusRequest.dataLoaded) {
          AppCherryToast.showSuccessToast(message: 'Booked successfully');
          numberOfTickets = 0;
          update();
        }
      } else {
        AppCherryToast.showErrorToast(errorMessage: 'No enough tickets try add less number of tickets');
      }
    } else {
      AppCherryToast.showErrorToast(errorMessage: 'Add number of tickets');
    }
  }
}
