import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/chat_ai_controller.dart';
import 'custom/chat_ai_bubble_widget.dart';

class ChatAiListWidget extends StatelessWidget {
  const ChatAiListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatAiController>(builder: (controller) {
      return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        itemCount: controller.chatList.length,
        itemBuilder: (context, index) => ChatAiBubbleWidget(
          isSender: !controller.chatList[index].isAi,
          message: controller.chatList[index].message,
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
      );
    });
  }
}
