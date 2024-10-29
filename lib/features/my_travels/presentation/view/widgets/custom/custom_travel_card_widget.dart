import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_wise/core/common/colors/app_colors.dart';
import 'package:travel_wise/shared/widgets/image/custom_cached_net_image.dart';

class CustomTravelCardWidget extends StatelessWidget {
  const CustomTravelCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors().white,
      borderRadius: BorderRadius.circular(12.r),
      elevation: 4,
      child: Row(
        children: [
          CustomCachedNetImage(
            imageUrl: 'https://images.unsplash.com/photo-1528543606781-2f6e6857f318?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D',
            height: 100.h,
            width: 110.w,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12.r)),
          ),
          SizedBox(width: 10.w,),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Travel name",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "price : 200\$",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: 10.h,
              ),Text(
                "Status : booked",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          )),
          SizedBox(width: 10.w,),
        ],
      ),
    );
  }
}
