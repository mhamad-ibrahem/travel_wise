import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/features/auth/login/presentation/controller/login_controller.dart';

import '../../../../../../core/helpers/validation/validation_type.dart';
import '../../../../../../core/helpers/validation/validations_errors.dart';
import '../../../../../../widgets/fields/custom_text_form_field.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    return Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 25.h),
            CustomTextFormField(
              textEditingController: controller.emailController,
              hint: 'Email',
              icon: const Icon(Icons.email),
              validator: (value) {
                return ValidationErrors.fieldValidation(
                    value: value!,
                    minValue: 2,
                    maxValue: 100,
                    validationType: ValidationType.email);
              },
            ),
            SizedBox(height: 25.h),
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
          ],
        ));
  }
}
