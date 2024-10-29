import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/my_travels_controller.dart';
import 'custom/custom_travel_card_widget.dart';

class MyTravelsListWidget extends StatelessWidget {
  const MyTravelsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<MyTravelsController>(
      builder: (controller) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) => const CustomTravelCardWidget(),
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
        );
      }
    );
  }
}
