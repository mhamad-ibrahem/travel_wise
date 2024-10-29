import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../shared/widgets/image/custom_upload_image_form.dart';


class CustomRegisterImageForm extends StatelessWidget {
  const CustomRegisterImageForm(
      {super.key,
      this.file,
      this.uploadImage,
      this.deleteImage,
      this.changeImage,
      required this.title});
  final File? file;
  final String title;
  final void Function()? uploadImage;
  final void Function()? deleteImage;
  final void Function()? changeImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 12.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
       CustomUploadImageForm(
            file: file,
            changeImage: changeImage,
            deleteImage: deleteImage,
            uploadImage: uploadImage,
          ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
