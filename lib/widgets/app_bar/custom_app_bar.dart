import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/common/colors/app_colors.dart';

AppBar customAppBar(
    {required String title,
    required BuildContext context,
    SystemUiOverlayStyle? systemOverlayStyle,
    List<Widget>? actions,
    bool isBack=true,
    VoidCallback? onPressed,
    bool isWhite=false,
    }) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: 50.h,
    title: Text(
      title,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: 18.sp,
            color: isWhite? AppColors().white: AppColors().black,
          ),
    ),
    leading:isBack? IconButton(
        onPressed:onPressed?? () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color:isWhite? AppColors().white: AppColors().black,
          size: 24.w
        )):null,
    actions: actions,
  );
}
