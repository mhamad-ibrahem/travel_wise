import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/common/colors/app_colors.dart';
import 'package:travel_wise/core/common/size/app_size.dart';
import '../../../../../../widgets/buttons/custom_button.dart';
import '../../../data/static/chat_ai_local_data_list.dart';
import '../../controller/chat_ai_controller.dart';

showChatQuestionsDialog({required BuildContext context}) {
   Get.dialog( Dialog(
          insetPadding: EdgeInsets.only(left: 10.w, right: 10.w,),
          child: SizedBox(
            height: AppSize.screenHeight(context: context)*0.8,
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                Expanded(
                  child: ListView.builder(
                    itemCount: chatAiData.length,
                    itemBuilder: (context, index) =>
                        GetBuilder<ChatAiController>(builder: (controller) {
                      return questionCard(
                          context: context,
                          isSelected: controller.selectedMessage ==
                              chatAiData[index].keys.first,
                          onTap: () {
                            controller.selectedMessage =
                                chatAiData[index].keys.first;
                            controller.update();
                          },
                          question: chatAiData[index].keys.first);
                    }),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                        height: 45,
                        buttonWidth: double.infinity * 0.5,
                        buttonColor: AppColors().red,
                        onTap: () {
                          Get.back();
                        },
                        buttonBody: 'Cancel'.tr,
                      )),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: CustomButton(
                        height: 45,
                        buttonWidth: double.infinity * 0.5,
                        onTap: () {
                          ChatAiController chatAiController = Get.find();
                          if (chatAiController.selectedMessage.isNotEmpty) {
                            int index = chatAiData.indexWhere((e) =>
                                e.keys.first == chatAiController.selectedMessage);
                            chatAiController.answerUserQuestion(index);
                          }
                        },
                        buttonBody: 'Confirm'.tr,
                      )),
                    ],
                  ),
                )
              ],
            ),
          )));
}

Widget questionCard(
    {required BuildContext context,
    bool isSelected = false,
    required String question,
    void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors().lightGrey3,
          borderRadius: BorderRadius.circular(8.r)),
      child: Text(
        question,
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: isSelected ? AppColors().white : null),
      ),
    ),
  );
}
