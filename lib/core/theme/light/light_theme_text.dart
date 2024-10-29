import 'package:flutter/material.dart';

import '../../common/assets/app_assets.dart';
import '../../common/colors/app_colors.dart';

AppColors appColors = AppColors();
TextStyle displaySmallLight() {
  return  TextStyle(
      color: appColors.black, fontSize: 12, fontWeight: FontWeight.w400,
      fontFamily:   AppAssets().poppins
      // fontFamily: LocalizationHelper.isEnglishLanguage()? AppAssets().tajawal:null
      );
}

TextStyle displayMediumLight() {
  return  TextStyle(
      color: appColors.black, fontSize: 16, fontWeight: FontWeight.w500,
      fontFamily:   AppAssets().poppins
      // fontFamily:LocalizationHelper.isEnglishLanguage()? AppAssets().tajawal:null
      );
}

TextStyle displayLargeLight() {
  return  TextStyle(
      color: appColors.black, fontSize: 20, fontWeight: FontWeight.bold,
    fontFamily:   AppAssets().poppins
      // fontFamily: LocalizationHelper.isEnglishLanguage()? AppAssets().tajawal:null
      );
}
