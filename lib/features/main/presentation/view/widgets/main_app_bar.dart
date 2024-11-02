import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/config/app_config.dart';
import 'package:travel_wise/core/helpers/log_helper/log_helper.dart';
import 'package:travel_wise/core/routes/route_export.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../controller/main_controller.dart';

AppBar mainAppBar({
  required BuildContext context,
  bool isBack = false,
  VoidCallback? onPressed,
}) {
  MainController mainController = Get.find();
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    toolbarHeight: 50.h,
    centerTitle: false,
    titleSpacing: 10,
    title: Text(
      '${mainController.userModel?.firstName} ${mainController.userModel?.lastName}',
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontSize: 14.sp,
            color: AppColors().white,
          ),
    ),
    leading: GestureDetector(
      onTap: (){
        LogHelper.logCyan("${AppConfig.baseImageUrl}/${mainController.userModel?.imagePath}");
      },
      child: Container(
        height: 30,
        width: 30,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: CachedNetworkImageProvider(mainController
                          .userModel?.imagePath ==
                      null
                  ? 'https://cdn-icons-png.flaticon.com/512/6596/6596121.png'
                  : "${AppConfig.baseImageUrl}/${mainController.userModel!.imagePath}"),
              fit: BoxFit.cover,
            )),
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {
            Get.toNamed(AppRoutes().notificationsRoute);
          },
          icon: Icon(
            Icons.notifications_active,
            color: AppColors().white,
          ))
    ],
  );
}
