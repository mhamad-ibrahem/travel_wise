import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/profile_tiles_widget.dart';
import '../widgets/profile_top_part_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: const Column(
        children: [
          ProfileTopPartWidget(),
          ProfileTilesWidget(),
        ],
      ),
    );
  }
}
