import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/common/colors/app_colors.dart';
import '../buttons/custom_delete_button.dart';

customDialog(
    {required BuildContext context,
    Color? backGroundColor,
    double? radius,
    bool canDismiss = true,
    String? title,
    required Widget child}) {
  Get.defaultDialog(
    backgroundColor: backGroundColor ?? AppColors().white,
    radius: radius ?? 8,
    barrierDismissible: canDismiss,
    titleStyle: Theme.of(context).textTheme.displayLarge,
    title: title ?? '',
    content: PopScope(
      canPop: canDismiss,
      onPopInvokedWithResult: (didPop, result) {},
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              const Row(),
              child,
            ],
          ),
          if (canDismiss)
            Positioned(
                top: -59.h, right: -17.w, child: const CustomExitButton()),
        ],
      ),
    ),
  );
}
