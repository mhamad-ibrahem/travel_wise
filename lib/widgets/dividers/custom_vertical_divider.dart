import 'package:flutter/material.dart';

import '../../core/common/colors/app_colors.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key, this.color,
      this.thickness,
      this.width,
      this.bottomPadding,
      this.topPadding});
 final Color? color;
  final double? thickness;
  final double? width;
  final double? bottomPadding;
  final double? topPadding;
  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color:  color ?? AppColors().grey,
      thickness: thickness,
      width: width,
      endIndent:bottomPadding ,
      indent:topPadding ,
      
    );
  }
}