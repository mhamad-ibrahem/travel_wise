import 'dart:convert';
import 'package:travel_wise/core/helpers/log_helper/log_helper.dart';
import '../../shared/data/model/local_user_data_model.dart';
import '../services/app_services.dart';
import '../services/sub_service/local_storage/local_storage_box/local_storage_box.dart';

class UserLocalData {
  static setUserLocalData({LocalUserData? value}) async {
    if (value != null) {
      AppServices.secureStorageService.setData(
          key: LocalStorageBox.userModelKey,
          value: json.encode(value.toJson()));
      LogHelper.logCyan("token ........ ${value.token}");
    }
  }
}
