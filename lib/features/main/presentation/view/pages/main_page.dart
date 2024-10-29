import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/config/classes/status_request.dart';
import 'package:travel_wise/features/main/presentation/controller/main_controller.dart';
import 'package:travel_wise/shared/widgets/handle_status/handling_data_request.dart';

import '../widgets/main_app_bar.dart';
import '../widgets/main_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        appBar: controller.statusRequest != StatusRequest.dataLoaded
            ? null
            : mainAppBar(context: context),
        bottomNavigationBar:
            controller.statusRequest != StatusRequest.dataLoaded
                ? null
                : const MainNavBar(),
        body: GetBuilder<MainController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            retryFunction: () {
              controller.getData();
            },
            message: controller.errorMessage,
            child: controller.mainPages[controller.currentIndex],
          ),
        ),
      );
    });
  }
}
