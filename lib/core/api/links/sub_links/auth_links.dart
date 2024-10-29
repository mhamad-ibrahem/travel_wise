import '../../../config/app_config.dart';

mixin AuthLinks {
  String get loginLink => "${AppConfig.baseUrl}/login";
  String get registerLink => "${AppConfig.baseUrl}/register";
}
