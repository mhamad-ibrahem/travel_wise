import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/to_do_add_task_button_widget.dart';
import '../widgets/to_do_tasks_list_widget.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ToDoAddTaskButtonWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ToDo :",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 15.h,
            ),
            const ToDoTasksListWidget()
          ],
        ),
      ),
    );
  }
}
