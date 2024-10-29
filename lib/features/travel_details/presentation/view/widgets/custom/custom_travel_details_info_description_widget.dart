import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/size/app_size.dart';

class CustomTravelDetailsInfoDescriptionWidget extends StatelessWidget {
  const CustomTravelDetailsInfoDescriptionWidget({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
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
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors().darkGrey,
                ),
          ),
        ],
      ),
    );
  }
}
