import 'package:get/get.dart';
import 'package:travel_wise/core/config/classes/status_request.dart';

import '../../data/model/chat_ai_message_model.dart';
import '../../data/static/chat_ai_local_data_list.dart';

class ChatAiController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  String selectedMessage = '';
  List<ChatAiMessageModel> chatList = [];
  answerUserQuestion(int index) {
    Get.back();
    statusRequest = StatusRequest.loading;
    chatList.add(
        ChatAiMessageModel(message: chatAiData[index].keys.first, isAi: false));
    update();
    Future.delayed(const Duration(seconds: 2), () {
      chatList.add(ChatAiMessageModel(
          message: chatAiData[index].values.first.message, isAi: true));
      selectedMessage = '';
       statusRequest = StatusRequest.none;
      update();
    });
  }
}
