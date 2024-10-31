import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/common/size/app_size.dart';
import '../../controller/home_controller.dart';
import 'custom/custom_travel_card.dart';

class HomeBusWidget extends StatelessWidget {
  const HomeBusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final  HomeController homeController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h,),
        Text(
          "Buses",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 210.h,
          width: AppSize.screenWidth(context: context),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: homeController.buses.length,
            itemBuilder: (context, index) => CustomTravelCardWidget(tripsModel: homeController.buses[index],),
            separatorBuilder: (context, index) => SizedBox(
              width: 10.w,
            ),
          ),
        )
      ],
    );
  }
}
