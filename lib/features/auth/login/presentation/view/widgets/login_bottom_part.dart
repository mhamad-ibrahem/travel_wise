import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/widgets/buttons/custom_button.dart';

import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/routes/constant/app_routes.dart';
import '../../controller/login_controller.dart';

class LoginBottomPartWidget extends StatelessWidget {
  const LoginBottomPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final LoginController controller = Get.find();
    return Column(
      children: [
        TextButton(
          onPressed: () {
            // الانتقال إلى صفحة نسيت كلمة المرور
            Get.toNamed(AppRoutes().forgetPasswordRoute);
          },
          child: Text(
            "Forgot Password?",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        SizedBox(height: 10.h),
        CustomButton(
          buttonWidth: 150.w,
          buttonBody: "Sign In",
          onTap: () {
           controller.login();
          },
        ),
        SizedBox(height: 20.h),
        TextButton(
          onPressed: () {
            // الانتقال إلى صفحة التسجيل
            Get.toNamed(AppRoutes().register);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(color: AppColors().black),
              ),
              TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, Routes.signup);
                    Get.toNamed(AppRoutes().register);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: AppColors().red),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
