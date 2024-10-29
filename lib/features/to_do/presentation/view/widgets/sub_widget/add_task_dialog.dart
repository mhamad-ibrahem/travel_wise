import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/common/colors/app_colors.dart';
import 'package:travel_wise/core/helpers/validation/validations_errors.dart';
import 'package:travel_wise/widgets/fields/custom_text_form_field.dart';
import '../../../../../../core/helpers/validation/validation_type.dart';
import '../../../../../../widgets/buttons/custom_button.dart';

addTaskDialog(
    {required Key addKey,
    required TextEditingController task,
    required void Function() fun,
    required BuildContext context}) {
  Get.defaultDialog(
    title: 'Add Task'.tr,
    titleStyle: Theme.of(context).textTheme.displayMedium,
    middleText: '',
    titlePadding: EdgeInsets.only(left: 60.w, right: 60.w, top: 20.h),
    content: Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Form(
        key: addKey,
        child: Column(
          children: [
            CustomTextFormField(
                isField: true,
                fillColor: AppColors().lightGrey3,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                numberOfLines: 4,
                validator: (value) {
                  return ValidationErrors.fieldValidation(
                      value: value!.trim(),
                      minValue: 1,
                      maxValue: 90,
                      validationType: ValidationType.none);
                },
                hint: 'Enter task'.tr,
                textEditingController: task),
            SizedBox(
              height: 10.h,
            ),
            Row(
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
                  onTap:fun,
                  buttonBody: 'Confirm'.tr,
                )),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
