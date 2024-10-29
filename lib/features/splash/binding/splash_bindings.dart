import 'package:get/get.dart';
import '../data/repo/splash_repo_impl.dart';
import '../presentation/controller/splash_controller.dart';
import '../domain/repo/splash_repo.dart';
import '../domain/use_case/get_local_user_data_use_case.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    SplashFeatureInjection.inject();
  }
}

class SplashFeatureInjection {
  static void inject() {
    Get.put(SplashRepoImpl());
    SplashRepo splashRepo = Get.find<SplashRepoImpl>();
    Get.put(GetUserLocalDataUseCase(splashRepo));
    Get.put(SplashController());
  }
}
