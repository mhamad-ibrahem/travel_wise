import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_wise/widgets/app_bar/custom_app_bar.dart';
import '../widgets/notifications_body_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Notifications', context: context),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        itemCount: 1,
        itemBuilder: (context, index) => const NotificationsBodyWidget(
          title: 'Trip number #54 booked',
        ),
      ),
    );
  }
}
