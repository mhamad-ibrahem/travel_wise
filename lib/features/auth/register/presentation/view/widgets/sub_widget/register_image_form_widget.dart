import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/helpers/file_helper/file_helper.dart';
import '../../../controller/register_controller.dart';
import '../custom/custom_register_image_form.dart';

class RegisterImageFormWidget extends StatelessWidget {
  const RegisterImageFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h,),
        GetBuilder<RegisterController>(
            builder: (controller) => CustomRegisterImageForm(
                  title: 'Personal image'.tr,
                  file: controller.personalImageFile,
                  changeImage: () async {
                    //select image
                    File? selectedFile;
                    selectedFile = await FileHelper.pickFile(context);
                    if (selectedFile != null) {
                      //if image not null change values
                      controller.personalImageFile = selectedFile;
                    }
                    controller.update();
                  },
                  deleteImage: () {
                    controller.personalImageFile = null;
                    controller.update();
                  },
                  uploadImage: () async {
                    //select image
                    File? selectedFile;
                    selectedFile = await FileHelper.pickFile(context);
                    if (selectedFile != null) {
                      //if image not null change values
                      controller.personalImageFile = selectedFile;
                    }
                    controller.update();
                  },
                )),
        GetBuilder<RegisterController>(
            builder: (controller) => CustomRegisterImageForm(
                  title: 'Passport image'.tr,
                  file: controller.passportFile,
                  changeImage: () async {
                    //select image
                    File? selectedFile;
                    selectedFile = await FileHelper.pickFile(context);
                    if (selectedFile != null) {
                      //if image not null change values
                      controller.passportFile = selectedFile;
                    }
                    controller.update();
                  },
                  deleteImage: () {
                    controller.passportFile = null;
                    controller.update();
                  },
                  uploadImage: () async {
                    //select image
                    File? selectedFile;
                    selectedFile = await FileHelper.pickFile(context);
                    if (selectedFile != null) {
                      //if image not null change values
                      controller.passportFile = selectedFile;
                    }
                    controller.update();
                  },
                )),
        GetBuilder<RegisterController>(
            builder: (controller) => CustomRegisterImageForm(
                  title: 'Emirates ID photo back face'.tr,
                  file: controller.nationPassportFile,
                  changeImage: () async {
                    //select image
                    File? selectedFile;
                    selectedFile = await FileHelper.pickFile(context);
                    if (selectedFile != null) {
                      //if image not null change values
                      controller.nationPassportFile = selectedFile;
                    }
                    controller.update();
                  },
                  deleteImage: () {
                    controller.nationPassportFile = null;
                    controller.update();
                  },
                  uploadImage: () async {
                    //select image
                    File? selectedFile;
                    selectedFile = await FileHelper.pickFile(context);
                    if (selectedFile != null) {
                      //if image not null change values
                      controller.nationPassportFile = selectedFile;
                    }
                    controller.update();
                  },
                )),
      ],
    );
  }
}
