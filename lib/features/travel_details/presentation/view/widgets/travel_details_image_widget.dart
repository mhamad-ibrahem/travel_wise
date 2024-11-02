import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/common/colors/app_colors.dart';
import 'package:travel_wise/core/common/size/app_size.dart';
import 'package:travel_wise/core/config/app_config.dart';
import 'package:travel_wise/shared/widgets/image/custom_cached_net_image.dart';

import '../../controller/travel_details_controller.dart';

class TravelDetailsImageWidget extends StatelessWidget {
  const TravelDetailsImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TravelDetailsController controller = Get.find();
    return Stack(
      children: [
        CustomCachedNetImage(
          imageUrl: "${AppConfig.baseImageUrl}/${controller.tripsModel?.image}",
          height: 280.h,
          width: AppSize.screenWidth(context: context),
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors().black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors().white,
                  size: 22.w,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
