import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/config/app_config.dart';
import 'package:travel_wise/features/home/data/model/trips_model.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/size/app_size.dart';
import '../../../../../../core/routes/constant/app_route_arguments_name.dart';
import '../../../../../../core/routes/constant/app_routes.dart';
import '../../../../../../shared/widgets/image/custom_cached_net_image.dart';

class CustomTravelCardWidget extends StatelessWidget {
  const CustomTravelCardWidget({super.key, this.tripsModel});
  final TripsModel? tripsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes().travelDetailsRoute,
            arguments: {AppRoutesArgumentsName.model: tripsModel});
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 5.h),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: AppSize.screenWidth(context: context) * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors().lightGrey3
                // boxShadow: [BoxShadow(color: AppColors().darkGrey)],
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCachedNetImage(
                  imageUrl: "${AppConfig.baseImageUrl}/${tripsModel?.image}",
                  width: AppSize.screenWidth(context: context) * 0.5,
                  height: 110.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                  child: Text(
                    tripsModel?.titleEn ?? 'Travel name',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 12.sp,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                  child: Text(
                    'Price : ${tripsModel?.offerValue ?? 100}\$',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 12.sp, color: AppColors.primaryColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                  ),
                  child: Text(
                    'Start at : ${tripsModel?.fromDate}',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 12.sp, color: AppColors.primaryColor),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                  child: Text(
                    'End at : ${tripsModel?.toDate}',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 12.sp, color: AppColors.primaryColor),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
