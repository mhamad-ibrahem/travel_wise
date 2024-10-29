import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/features/my_travels/presentation/controller/my_travels_controller.dart';

import '../../../../../core/common/colors/app_colors.dart';
import '../../controller/main_controller.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => BottomNavigationBar(
          currentIndex: controller.currentIndex,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (val) async {
            Get.until((route) => route.isFirst);
            controller.currentIndex = val;
            controller.update();
            if(val==1){
              MyTravelsController myTravelsController = Get.find();
              myTravelsController.getData();
              myTravelsController.cancelToken.cancel(['stop']);
            }
          },
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors().white,
          backgroundColor: AppColors().black.withOpacity(0.87),
          enableFeedback: false,
          selectedLabelStyle: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontSize: 10.sp),
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontSize: 10.sp),
          items: [
            navBarItem(Icons.home, 'Home'),
            navBarItem(Icons.library_books_rounded, 'My Travels'),
            navBarItem(Icons.chat_bubble, 'Chat Ai'),
            navBarItem(Icons.task, 'To Do'),
            navBarItem(Icons.person, 'Profile'),
          ]),
    );
  }

  BottomNavigationBarItem navBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 3.h),
        child: Icon(
          icon,
          size: 20.w,
        ),
      ),
      label: label,
    );
  }
}
