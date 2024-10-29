import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/data/model/local_user_data_model.dart';
import '../localization/controller/localization_controller.dart';
import 'sub_service/local_storage/get_storage.dart';
import 'sub_service/local_storage/secure_storage.dart';

class AppServices extends GetxService {
  static LocalizationController? localizationController;
  static String fcmToken = '';
  static LocalUserData? localUserData;
  static late SecureStorageService secureStorageService;

  Future<AppServices> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    injectGetStorage(useGetStorage:true);
    secureStorageService =  Get.put(SecureStorageService());
    await secureStorageService.initialStorage();
    localizationController =await Get.put(LocalizationController());
    return this;
  }

  injectGetStorage({bool useGetStorage = false}) async {
    if (useGetStorage) {
      Get.put(LocalStorageService());
      await LocalStorageService.init();
    }
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
