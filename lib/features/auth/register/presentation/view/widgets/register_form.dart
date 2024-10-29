import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/helpers/log_helper/log_helper.dart';
import 'package:travel_wise/features/auth/register/presentation/controller/register_controller.dart';
import 'package:travel_wise/widgets/drop_downs/custom_drop_down.dart';

import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/helpers/validation/validation_type.dart';
import '../../../../../../core/helpers/validation/validations_errors.dart';
import '../../../../../../widgets/fields/custom_text_form_field.dart';
import 'sub_widget/register_image_form_widget.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.find();
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "New to our platform ?\ncreate new account to access our app",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 25.h),
          CustomTextFormField(
            textEditingController: controller.firstNameController,
            hint: 'First Name',
            icon: const Icon(Icons.person),
            validator: (value) {
              return ValidationErrors.fieldValidation(
                  value: value!,
                  minValue: 2,
                  maxValue: 100,
                  validationType: ValidationType.none);
            },
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(
            textEditingController: controller.lastNameController,
            hint: 'Last Name',
            icon: const Icon(Icons.person),
            validator: (value) {
              return ValidationErrors.fieldValidation(
                  value: value!,
                  minValue: 2,
                  maxValue: 100,
                  validationType: ValidationType.none);
            },
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(
            textEditingController: controller.emailController,
            hint: 'Email',
            icon: const Icon(Icons.mail),
            validator: (value) {
              return ValidationErrors.fieldValidation(
                  value: value!,
                  minValue: 2,
                  maxValue: 100,
                  validationType: ValidationType.email);
            },
          ),

          SizedBox(height: 15.h),

          CustomTextFormField(
            textEditingController: controller.mobileController,
            hint: 'Mobile',
            icon: const Icon(Icons.phone_android_outlined),
            validator: (value) {
              return ValidationErrors.fieldValidation(
                  value: value!,
                  minValue: 8,
                  maxValue: 12,
                  validationType: ValidationType.number);
            },
          ),

          SizedBox(height: 15.h),

          // حقل اختيار تاريخ الميلاد
          GestureDetector(
            onTap: () {
              controller.chooseDate(showDatePicker(
                context: context,
                initialDate: controller.date,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                        colorScheme: const ColorScheme.light(
                          primary:
                              AppColors.primaryColor, // header background color
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                AppColors.primaryColor, // button text color
                          ),
                        ),
                        inputDecorationTheme: const InputDecorationTheme(
                            labelStyle: TextStyle(color: Colors.black))),
                    child: child!,
                  );
                },
              ));
            },
            child: CustomTextFormField(
              isEnable: false,
              textEditingController: controller.birthDateController,
              icon: const Icon(Icons.calendar_month_outlined),
              hint: 'Date of Birth',
              validator: (value) {
                return ValidationErrors.fieldValidation(
                    value: value!,
                    minValue: 2,
                    maxValue: 100,
                    validationType: ValidationType.none);
              },
            ),
          ),
          SizedBox(height: 15.h),
          // حقل الجنس بشكل outline
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(8.r)),
            child: GetBuilder<RegisterController>(
              builder: (controller) => CustomDropDown(
                hintText: 'Gender',
                itemsList: ['Male', 'Female'],
                selectedValue: controller.selectedGender,
                onChanged: (value) {
                  controller.selectedGender = value;
                  LogHelper.logSuccess(
                      "selectedGender ${controller.selectedGender}");
                  controller.update();
                },
              ),
            ),
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(
            textEditingController: controller.passwordController,
            hint: 'Password',
            icon: const Icon(Icons.lock),
            validator: (value) {
              return ValidationErrors.fieldValidation(
                  value: value!,
                  minValue: 6,
                  maxValue: 100,
                  validationType: ValidationType.none);
            },
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(
            textEditingController: controller.confirmPasswordController,
            hint: 'Confirm Password',
            icon: const Icon(Icons.lock),
            validator: (value) {
              return ValidationErrors.fieldValidation(
                  value: value!,
                  minValue: 6,
                  maxValue: 100,
                  validationType: ValidationType.none);
            },
          ),
          const RegisterImageFormWidget(),
        ],
      ),
    );
  }
}
