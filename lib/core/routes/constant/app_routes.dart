import 'sub_routes/auth_routes.dart';
import 'sub_routes/main_routes.dart';

class AppRoutes with AuthRoutes,MainRoutes {
  static String splashScreen = "/splash";
}
