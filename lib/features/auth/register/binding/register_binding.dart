import 'package:get/get.dart';

import '../data/repo_impl/login_repo_impl.dart';
import '../domain/repo/register_repo.dart';
import '../domain/use_case/register_use_case.dart';
import '../presentation/controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterRepoImpl());
    RegisterRepo registerRepo = Get.find<RegisterRepoImpl>();
    Get.put(RegisterUseCase(registerRepo));
    Get.put(RegisterController(registerUseCase: Get.find()));
  }
}
