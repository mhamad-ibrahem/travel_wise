import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/common/size/app_size.dart';

import '../../../../../../core/common/colors/app_colors.dart';
import '../../../controller/to_do_controller.dart';

class ToDoTaskCardWidget extends StatelessWidget {
  const ToDoTaskCardWidget(
      {super.key,
      required this.title,
      required this.checkTask,
      required this.onDelete,
      this.check});
  final String title;
  final bool checkTask;
  final VoidCallback onDelete;
  final void Function()? check;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16.r)),
          width: AppSize.screenWidth(context: context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20.h,
              ),
              Expanded(
                child: GetBuilder<ToDoController>(
                  builder: (controller) {
                    return Text(
                      title,
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          decoration: checkTask == false
                              ? TextDecoration.none
                              : TextDecoration.lineThrough,
                              fontSize: 13.sp,
                          color: AppColors().white),
                    );
                  }
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: check,
                    child: GetBuilder<ToDoController>(
                      builder: (controller) {
                        return Container(
                          alignment: Alignment.center,
                          height: 16.h,
                          width: 16.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(color: AppColors().white),
                              color: checkTask == false
                                  ? Colors.transparent
                                  : AppColors().white),
                          child: Icon(
                            Icons.check,
                            color: checkTask == false
                                ? Colors.transparent
                                : AppColors().green,
                            size: 15.w,
                          ),
                        );
                      }
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: onDelete,
                          icon: Icon(
                            Icons.delete_outlined,
                            color: AppColors().red,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}
