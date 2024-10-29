import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_wise/core/common/colors/app_colors.dart';

class NotificationsBodyWidget extends StatelessWidget {
  const NotificationsBodyWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(25.r)),
      child: Row(
        children: [
          Icon(
            Icons.notification_important_outlined,
            size: 22.w,
            color: AppColors().white,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors().white),
          )
        ],
      ),
    );
  }
}
