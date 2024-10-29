import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/common/colors/app_colors.dart';
import '../../controller/to_do_controller.dart';
import 'sub_widget/add_task_dialog.dart';

class ToDoAddTaskButtonWidget extends StatelessWidget {
  const ToDoAddTaskButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ToDoController controller = Get.find();
    return GestureDetector(
      onTap: () {
        addTaskDialog(
            addKey: controller.formState,
            task: controller.task,
            fun: () {
              controller.addTask();
            },
            context: context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors().green,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.add,
          color: AppColors().white,
          size: 30.w,
        ),
      ),
    );
  }
}
