import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/colors/app_colors.dart';

showLoadingDialog({Color?color}) {
  return Get.dialog(
      barrierDismissible: false,
      PopScope(
       canPop: false,
        child: Container(
          height: 40.h,
          width: 40.w,
          alignment: Alignment.center,
          child:  CircularProgressIndicator(
            color:color?? AppColors.primaryColor,
          ),
        ),
      ));
}
