import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/common/colors/app_colors.dart';



class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Icon(Icons.arrow_back_ios_rounded, color: color ?? AppColors.primaryColor,),
      ),
     
    );
  }
}
