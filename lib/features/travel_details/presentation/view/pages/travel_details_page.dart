import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../shared/widgets/counter/counter_widget.dart';
import '../../../../../widgets/buttons/custom_button.dart';
import '../../../../main/presentation/view/widgets/main_nav_bar.dart';
import '../../controller/travel_details_controller.dart';
import '../widgets/travel_details_description_widget.dart';
import '../widgets/travel_details_image_widget.dart';
import '../widgets/travel_details_info_widget.dart';

class TravelDetailsPage extends StatelessWidget {
  const TravelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainNavBar(),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TravelDetailsImageWidget(),
                  TravelDetailsInfoWidget(),
                  TravelDetailsDescriptionWidget(),
                  // TravelDetailsTripPlanWidget()
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Number of tickets',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                GetBuilder<TravelDetailsController>(builder: (controller) {
                  return SharedCounterWidget(
                    quantity: controller.numberOfTickets,
                    increment: () {
                      controller.numberOfTickets++;
                      controller.update();
                    },
                    decrement: () {
                      if (controller.numberOfTickets > 0) {
                        controller.numberOfTickets--;
                        controller.update();
                      }
                    },
                  );
                }),
                Center(
                    child: CustomButton(
                        buttonBody: "Book now",
                        onTap: () {
                          TravelDetailsController controller = Get.find();
                          controller.bookTrip();
                        })),
              ],
            ),
          )
        ],
      ),
    );
  }
}
