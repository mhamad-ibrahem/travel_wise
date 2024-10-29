import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/widgets/buttons/custom_button.dart';
import '../../controller/register_controller.dart';

class RegisterBottomPartWidget extends StatelessWidget {
  const RegisterBottomPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
     RegisterController controller =Get.find();
    return Column(
      children: [
        SizedBox(height: 25.h),
        CustomButton(
          buttonWidth: 150.w,
          buttonBody: 'Sign Up', onTap: () {controller.register();}),
        TextButton(
          onPressed: () {
               Get.back();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(color: Colors.black),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
