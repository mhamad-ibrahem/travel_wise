import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/api/classes/dio_response.dart';
import 'package:travel_wise/core/config/classes/status_request.dart';
import 'package:travel_wise/core/routes/constant/app_routes.dart';
import 'package:travel_wise/core/services/app_services.dart';
import 'package:travel_wise/shared/widgets/loading/loading_dialog.dart';
import '../../../../../core/helpers/user_local_data.dart';
import '../../../../../shared/widgets/toast/cherry_toast.dart';
import '../../data/model/login_model.dart';
import '../../domain/use_case/login_use_case.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  LoginController({required this.loginUseCase});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login() async {
    if (formKey.currentState!.validate()) {
      showLoadingDialog();
      ApiResponse response = await loginUseCase.execute(LoginModel(
          email: emailController.text, password: passwordController.text));
      Get.back();
      if (response.statusRequest == StatusRequest.dataLoaded) {
        AppServices.localUserData = response.responseData;
        UserLocalData.setUserLocalData(value: AppServices.localUserData);
        Get.offAllNamed(AppRoutes().mainRoute);
        AppCherryToast.showSuccessToast(message: 'Login successfully');
      }
    }
  }
}
