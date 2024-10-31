import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_wise/features/home/presentation/controller/home_controller.dart';
import 'package:travel_wise/shared/widgets/handle_status/handling_data_request.dart';

import '../widgets/home_bus.dart';
import '../widgets/home_offers.dart';
import '../widgets/home_search_field.dart';
import '../widgets/home_travels.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return HandlingDataRequest(
        statusRequest: controller.statusRequest,
        retryFunction: () {
          controller.getData();
        },
        message: controller.errorMessage,
        child: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:  Column(
            children: [
              HomeSearchFieldWidget(),
              HomeTravelsWidget(),
              HomeOffersWidget(),
              HomeBusWidget(),
            ],
          ),
        ),
      );
    });
  }
}
