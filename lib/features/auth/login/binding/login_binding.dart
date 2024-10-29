import 'package:get/get.dart';

import '../data/repo_impl/login_repo_impl.dart';
import '../domain/repo/login_repo.dart';
import '../domain/use_case/login_use_case.dart';
import '../presentation/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginRepoImpl());
    LoginRepo loginRepo = Get.find<LoginRepoImpl>();
    Get.put(LoginUseCase(loginRepo));
    Get.put(LoginController(loginUseCase: Get.find()));
  }
}
