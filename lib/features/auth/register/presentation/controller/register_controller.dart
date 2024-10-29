import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_wise/features/auth/register/domain/use_case/register_use_case.dart';

import '../../../../../core/api/classes/dio_response.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../shared/widgets/loading/loading_dialog.dart';
import '../../../../../shared/widgets/toast/cherry_toast.dart';
import '../../data/model/register_model.dart';

class RegisterController extends GetxController {
  final RegisterUseCase registerUseCase;
  RegisterController({required this.registerUseCase});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  String? selectedGender;
  File? passportFile;
  File? personalImageFile;
  File? nationPassportFile;
  DateTime date = DateTime.now();

  register() async {
    if (formKey.currentState!.validate() && selectedGender != null&&passportFile!=null&&nationPassportFile!=null) {
      showLoadingDialog();
      ApiResponse response = await registerUseCase.execute(RegisterModel(
          email: emailController.text,
          password: passwordController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          mobile: mobileController.text,
          gender: selectedGender!,
          birthDate: birthDateController.text,
          passportImage: passportFile!.path,
          nationImage: nationPassportFile!.path,
          image: personalImageFile?.path??'',
          ));
      Get.back();
      if (response.statusRequest == StatusRequest.dataLoaded) {
        Get.back();
        AppCherryToast.showSuccessToast(message: 'Created successfully');
      }
    } else {
      AppCherryToast.showErrorToast(errorMessage: "Fill all field");
    }
  }

  chooseDate(Future<DateTime?> datePicker) async {
    DateTime? newDate = await datePicker;
    if (newDate != null) {
      date = newDate;
      birthDateController.text = "${date.year}-${date.month}-${date.day}";
      update();
    } else {}
  }
}
