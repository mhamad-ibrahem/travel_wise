import 'package:flutter/material.dart';
import '../../common/assets/app_assets.dart';
import '../../common/colors/app_colors.dart';

AppColors appColors = AppColors();
TextStyle displaySmallLightAr() {
  return TextStyle(
      color: appColors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: AppAssets().poppins);
}

TextStyle displayMediumLightAr() {
  return TextStyle(
      color: appColors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: AppAssets().poppins);
}

TextStyle displayLargeLightAr() {
  return TextStyle(
      color: appColors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: AppAssets().poppins);
}
