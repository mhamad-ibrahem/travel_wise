import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/common/colors/app_colors.dart';
import 'package:travel_wise/core/common/size/app_size.dart';

import '../../controller/travel_details_controller.dart';


class TravelDetailsInfoWidget extends StatelessWidget {
  const TravelDetailsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TravelDetailsController controller=Get.find();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: AppSize.screenWidth(context: context),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors().lightGrey2!, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          controller.tripsModel?.titleEn??  "TRavel name",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Price : ${controller.tripsModel?.offerValue??200}\$",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
          SizedBox(
            height: 5.h,
          ),
           Text(
            "Start at : ${controller.tripsModel?.fromDate}",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors().green,
                ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "End at : ${controller.tripsModel?.toDate}",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors().red,
                ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Remaining seats : ${controller.tripsModel?.minCapacity}/${controller.tripsModel?.maxCapacity}",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors().darkGrey,
                ),
          ),
        ],
      ),
    );
  }
}
