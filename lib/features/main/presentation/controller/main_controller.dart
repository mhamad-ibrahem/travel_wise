import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_wise/core/helpers/log_helper/log_helper.dart';
import 'package:travel_wise/features/home/presentation/view/pages/home_page.dart';
import 'package:travel_wise/features/main/data/model/user_model.dart';
import 'package:travel_wise/features/profile/presentation/view/pages/profile_page.dart';

import '../../../../core/api/classes/dio_response.dart';
import '../../../../core/config/classes/status_request.dart';
import '../../../chat_ai/presentation/view/pages/chat_ai_page.dart';
import '../../../my_travels/presentation/view/pages/my_travels_page.dart';
import '../../../to_do/presentation/view/pages/to_do_page.dart';
import '../../domain/use_case/get_user_data_use_case.dart';

class MainController extends GetxController {
  final GetUserDataUseCase getUserDataUseCase;
  MainController({required this.getUserDataUseCase});
  UserModel? userModel;
  int currentIndex = 0;
  final List<Widget> mainPages = [
    const HomePage(),
    const MyTravelsPage(),
    const ChatAiPage(),
    const ToDoPage(),
    const ProfilePage()
  ];
  
  StatusRequest statusRequest = StatusRequest.none;
  String errorMessage = '';
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    ApiResponse response = await getUserDataUseCase.execute();
    statusRequest = response.statusRequest;
    update();
    if (statusRequest == StatusRequest.dataLoaded) {
      userModel= response.responseData;
      LogHelper.logMagenta("user name ${userModel?.firstName}");
      update();
    } else {
      errorMessage = response.errorMessage ?? '';
      update();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
