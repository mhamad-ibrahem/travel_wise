import 'package:get/get.dart';

import '../../chat_ai/binding/chat_ai_binding.dart';
import '../../home/binding/home_binding.dart';
import '../../my_travels/binding/my_travels_binding.dart';
import '../../to_do/binding/to_do_binding.dart';
import '../data/repo_impl/home_repo_impl.dart';
import '../domain/repo/main_repo.dart';
import '../domain/use_case/get_user_data_use_case.dart';
import '../presentation/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    ToDoBinding.injection();
    HomeBinding.injection();
    ChatAiBinding.injection();
    MyTravelsBinding.injection();
    //main
    Get.put(MainRepoImpl());
    MainRepo mainRepo = Get.find<MainRepoImpl>();
    Get.put(GetUserDataUseCase(mainRepo));
    Get.put(MainController(getUserDataUseCase: Get.find()));
  }
}
