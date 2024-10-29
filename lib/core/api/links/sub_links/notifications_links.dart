import '../../../config/app_config.dart';


mixin NotificationsLink {
  String get getNotifications =>
      "${AppConfig.baseUrl}/notification";
}
