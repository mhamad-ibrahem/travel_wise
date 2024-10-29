import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_wise/core/common/colors/app_colors.dart';

class CustomProfileTileWidget extends StatelessWidget {
  const CustomProfileTileWidget(
      {super.key, required this.icon, required this.title, this.onTap});
  final IconData icon;
 final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(25.r)),
        child: Row(
          children: [
            Icon(
              icon,
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
      ),
    );
  }
}
