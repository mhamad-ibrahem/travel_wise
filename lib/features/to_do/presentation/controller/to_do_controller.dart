import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/to_do_model.dart';

class ToDoController extends GetxController {
  final TextEditingController task = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  List<ToDoModel> todoList = [];

  addTask() {
    if (formState.currentState!.validate()) {
      todoList.add(ToDoModel(
        task: task.text,
      ));
      task.clear();
      update();
      Get.back();
    }
  }

  changeTaskState(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    update();
  }

  deleteTask(int index) {
    todoList.removeAt(index);
    update();
  }

  @override
  void dispose() {
    task.dispose();
    super.dispose();
  }
}
