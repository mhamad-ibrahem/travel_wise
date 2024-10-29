import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/services/app_services.dart';

import '../../../../../core/routes/constant/app_routes.dart';
import 'custom/custom_profile_tile_widget.dart';

class ProfileTilesWidget extends StatelessWidget {
  const ProfileTilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProfileTileWidget(
          onTap: () {},
          icon: Icons.edit,
          title: 'Edit profile',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomProfileTileWidget(
          onTap: () {},
          icon: Icons.lock,
          title: 'Change password',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomProfileTileWidget(
          onTap: () {
            Get.toNamed(AppRoutes().notificationsRoute);
          },
          icon: Icons.notifications_active,
          title: 'Notifications',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomProfileTileWidget(
          onTap: () {},
          icon: Icons.email_outlined,
          title: 'Contact us',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomProfileTileWidget(
          onTap: () {},
          icon: Icons.info_outline,
          title: 'About us',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomProfileTileWidget(
          onTap: () {},
          icon: Icons.feedback_outlined,
          title: 'Feed back',
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomProfileTileWidget(
          onTap: () {
            AppServices.secureStorageService.clear();
            Get.offAllNamed(AppRoutes().login);
          },
          icon: Icons.logout,
          title: 'Logout',
        ),
      ],
    );
  }
}
