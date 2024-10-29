import 'package:get/get.dart';

import '../presentation/controller/chat_ai_controller.dart';

class ChatAiBinding {
static void  injection() {
    Get.put(ChatAiController());
  }
}
