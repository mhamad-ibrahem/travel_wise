import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/travel_details_controller.dart';
import 'custom/custom_travel_details_info_description_widget.dart';

class TravelDetailsDescriptionWidget extends StatelessWidget {
  const TravelDetailsDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TravelDetailsController controller = Get.find();
    return CustomTravelDetailsInfoDescriptionWidget(
      title: 'Description',
      subtitle: controller.tripsModel?.descriptionType ?? '',
    );
  }
}
