import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_wise/features/my_travels/presentation/controller/my_travels_controller.dart';
import 'package:travel_wise/shared/widgets/handle_status/handling_data_request.dart';

import '../widgets/my_travels_list_widget.dart';

class MyTravelsPage extends StatelessWidget {
  const MyTravelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTravelsController>(builder: (controller) {
      return HandlingDataRequest(
        statusRequest: controller.statusRequest,
        retryFunction: () {
          controller.getData();
        },
        message: controller.errorMessage,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My booked travels :",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 15.h,
              ),
              const MyTravelsListWidget()
            ],
          ),
        ),
      );
    });
  }
}
