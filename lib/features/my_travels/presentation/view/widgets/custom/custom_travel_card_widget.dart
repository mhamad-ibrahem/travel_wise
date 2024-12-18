import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_wise/core/common/colors/app_colors.dart';
import 'package:travel_wise/core/config/app_config.dart';
import 'package:travel_wise/shared/widgets/image/custom_cached_net_image.dart';

import '../../../../data/model/my_travels_model.dart';

class CustomTravelCardWidget extends StatelessWidget {
  const CustomTravelCardWidget({super.key, required this.model});
  final MyTravelsModel model;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors().white,
      borderRadius: BorderRadius.circular(12.r),
      elevation: 4,
      child: Row(
        children: [
          CustomCachedNetImage(
            imageUrl:
                "${AppConfig.baseImageUrl}/${model.travels.image}",
            width: 110.w,
            height: 100.h,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12.r)),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.travels.titleEn ?? '',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "price : ${model.travels.offerValue ?? 200}\$",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Status : ${model.status}",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          )),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
    );
  }
}
