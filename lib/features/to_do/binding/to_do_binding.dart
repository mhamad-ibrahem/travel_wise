import 'package:get/get.dart';

import '../presentation/controller/to_do_controller.dart';

class ToDoBinding {
 static void injection() {
    Get.put(ToDoController());
  }
}
