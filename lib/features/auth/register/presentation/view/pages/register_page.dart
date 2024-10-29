import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_wise/core/common/size/app_size.dart';
import 'package:travel_wise/widgets/app_bar/custom_app_bar.dart';
import '../widgets/register_bottom_part.dart';
import '../widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            customAppBar(title: 'Register', context: context, ),
        body: Container(
          height: AppSize.screenHeight(
              context: context), // تحديد الارتفاع للواجهة البيضاء
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Column(
            children: [
              Expanded(
                child: const SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: RegisterFormWidget()),
              ),
              RegisterBottomPartWidget(),
            ],
          ),
        ));
  }
}
