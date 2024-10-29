import 'package:get/get.dart';
import 'package:travel_wise/core/config/app_config.dart';
import '../../../../core/config/classes/status_request.dart';
import '../../../../core/helpers/log_helper/log_helper.dart';
import '../../../../core/routes/constant/app_routes.dart';
import '../../../../core/services/app_services.dart';
import '../../domain/use_case/get_local_user_data_use_case.dart';

class SplashController extends GetxController {
  GetUserLocalDataUseCase getUserLocalDataUseCase = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    initialServices();
    super.onInit();
  }

  initialServices() async {
    statusRequest = StatusRequest.loading;
    update();
    Future.delayed(const Duration(seconds: 3), () async {
      try {
        AppServices.localUserData = await getUserLocalDataUseCase.execute();
        AppConfig.initialEnvData();
        statusRequest = StatusRequest.none;
        LogHelper.logSuccess("token is :  ${AppServices.localUserData?.token}");
        update();
        AppServices.localUserData != null
            ? Get.offAllNamed(AppRoutes().mainRoute)
            : Get.offAllNamed(AppRoutes().login);
      } catch (exception) {
        LogHelper.logError(exception.toString());
        statusRequest = StatusRequest.failure;
        update();
      }
    });
  }
}
