import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/common/colors/app_colors.dart';
import 'package:travel_wise/core/config/classes/status_request.dart';
import 'package:travel_wise/features/chat_ai/presentation/controller/chat_ai_controller.dart';
import 'package:travel_wise/shared/widgets/loading/loading_points/loading_points.dart';
import 'package:travel_wise/widgets/buttons/custom_button.dart';

import '../widgets/chat_ai_list_widget.dart';
import '../widgets/chat_ai_show_questions_dialog.dart';

class ChatAiPage extends StatelessWidget {
  const ChatAiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          children: [
            Expanded(child: const ChatAiListWidget()),
            GetBuilder<ChatAiController>(
              builder: (controller) =>
                  controller.statusRequest == StatusRequest.loading
                      ? const LoadingPoint(
                          color: AppColors.primaryColor,
                        )
                      : const SizedBox(),
            ),
          ],
        )),
        SizedBox(
          height: 10.h,
        ),
        CustomButton(
            buttonBody: 'Ask a question',
            onTap: () {
              showChatQuestionsDialog(context: context);
            }),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}
