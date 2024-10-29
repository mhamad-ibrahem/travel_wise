import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/helpers/localization/localization_helper.dart';
import '../../../core/helpers/log_helper/log_helper.dart';

class AppCherryToast {
  static showErrorToast({
    required String errorMessage,
  }) {
    LogHelper.logError(errorMessage);
    CherryToast.error(
            title: Text(errorMessage,
                style: Theme.of(Get.context!)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 14.sp),
                textAlign: LocalizationHelper.isEnglishLanguage()? TextAlign.start: TextAlign.end),
            animationType: AnimationType.fromRight,
            animationDuration: const Duration(milliseconds: 1000),
            autoDismiss: true)
        .show(Get.context!);
  }

  static showSuccessToast({
    required String message,
  }) {
    LogHelper.logSuccess(message);
    CherryToast.success(
            title: Text(message,
                style: Theme.of(Get.context!)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 14.sp),
                textAlign:LocalizationHelper.isEnglishLanguage()? TextAlign.start: TextAlign.end))
        .show(Get.context!);
  }
}
