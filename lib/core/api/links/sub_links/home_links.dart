import 'package:travel_wise/core/services/app_services.dart';

import '../../../config/app_config.dart';

mixin HomeLinks {
  String get getHomeDataLink => "${AppConfig.baseUrl}/admin/travels";
  String get getMyTravelsDataLink => "${AppConfig.baseUrl}/admin/user/travels";

  String get bookTripLink => "${AppConfig.baseUrl}/admin/countries";
  String get getProfileLink =>
      "${AppConfig.baseUrl}/admin/users/${AppServices.localUserData?.id}";

//  String get getProfileLink =>
//       "${AppConfig.baseUrl}/admin/users/1|Zz3t6y3kYpTi8BzFGhusxVTNHqPmQeced7zULilX0f661f81";

     
}
