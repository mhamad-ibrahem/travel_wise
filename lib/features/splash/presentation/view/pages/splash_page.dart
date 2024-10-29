import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/size/app_size.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../shared/widgets/handle_status/sub_widget/retry_button.dart';
import '../../../../../shared/widgets/loading/loading_logo.dart';
import '../../../../../shared/widgets/loading/loading_points/loading_points.dart';
import '../../controller/splash_controller.dart';
import '../widgets/splash_screen_effect.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        SplashScreenEffect(
            child: 
            Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedLogo(
          height: AppSize.screenHeight(context: context) * 0.35,
          width: AppSize.screenWidth(context: context),
        ),
        SizedBox(
          height: 20.h,
        ),
        GetBuilder<SplashController>(
            builder: (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? LoadingPoint(
                        size: 20.w,
                      )
                    : controller.statusRequest == StatusRequest.failure
                        ? RetryButton(
                            isWithUpperText: false,
                            colorOfRetryText: AppColors().white,
                            onTap: () {
                              controller.initialServices();
                            })
                        : const SizedBox()),
      ],
    )));
  }
}
