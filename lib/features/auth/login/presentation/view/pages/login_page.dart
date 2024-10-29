import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_wise/core/common/size/app_size.dart';
import 'package:travel_wise/widgets/app_bar/custom_app_bar.dart';
import '../widgets/login_bottom_part.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Login',
        context: context,
        isBack: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: AppSize.screenHeight(context: context),
          padding:
              const EdgeInsets.only(left: 25, top: 50, right: 25, bottom: 50),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Again",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Please fill all field to login",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const LoginFormWidget(),
              const LoginBottomPartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
