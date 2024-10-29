import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/to_do_controller.dart';
import 'custom/to_do_task_card_widget.dart';

class ToDoTasksListWidget extends StatelessWidget {
  const ToDoTasksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToDoController>(builder: (controller) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.todoList.length,
        itemBuilder: (context, index) => ToDoTaskCardWidget(
          title: controller.todoList[index].task,
          checkTask: controller.todoList[index].isDone,
          onDelete: () {
            controller.deleteTask(index);
          },
          check: () {
            controller.changeTaskState(index);
          },
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
      );
    });
  }
}
