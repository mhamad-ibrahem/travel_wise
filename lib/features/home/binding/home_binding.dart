import 'package:get/get.dart';

import '../data/repo_impl/home_repo_impl.dart';
import '../domain/repo/home_repo.dart';
import '../domain/use_case/get_home_data_use_case.dart';
import '../presentation/controller/home_controller.dart';

class HomeBinding {
 static void injection() {
    Get.put(HomeRepoImpl());
    HomeRepo homeRepo = Get.find<HomeRepoImpl>();
    Get.put(GetHomeDataUseCase(homeRepo));
    Get.put(HomeController(getHomeDataUseCase: Get.find()));
  }
}
