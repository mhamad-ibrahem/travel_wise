import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/common/colors/app_colors.dart';
import 'core/localization/locallization.dart';
import 'core/routes/app_router.dart';
import 'core/routes/constant/app_routes.dart';
import 'core/services/app_services.dart';
import 'core/theme/theme.dart';

void main() async {
  await initialServices();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors().black));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeArLang,
          initialRoute: AppRoutes.splashScreen,
          translations: Localization(),
          locale: AppServices.localizationController?.language,
          getPages: AppRouter.getPages,
        );
      },
    );
  }
}
