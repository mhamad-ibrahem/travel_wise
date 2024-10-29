import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../shared/widgets/image/custom_cached_net_image.dart';
import '../../../../main/presentation/controller/main_controller.dart';

class ProfileTopPartWidget extends StatelessWidget {
  const ProfileTopPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    return Column(
      children: [
        CustomCachedNetImage(
          imageUrl:mainController.userModel?.imagePath?? 'https://cdn-icons-png.flaticon.com/512/6596/6596121.png',
          height: 100.h,
          width: 100.w,
          borderRadius: BorderRadius.circular(50.r),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          '${mainController.userModel?.email}',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          '${mainController.userModel?.firstName} ${mainController.userModel?.lastName}',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
