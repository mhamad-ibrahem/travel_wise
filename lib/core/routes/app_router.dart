import 'package:get/get.dart';
import '../../features/travel_details/binding/travel_details_binding.dart';
import '../../features/travel_details/presentation/view/pages/travel_details_page.dart';
import 'route_export.dart';

class AppRouter {
  static List<GetPage> getPages = [
    CustomRoutePage.getPage(
      routeName: AppRoutes.splashScreen,
      page: const SplashPage(),
      binding: SplashBinding(),
    ),
    //auth
    CustomRoutePage.getPage(
      routeName: AppRoutes().login,
      page: const LoginPage(),
      binding: LoginBinding(),
    ),
    CustomRoutePage.getPage(
      routeName: AppRoutes().register,
      page: const RegisterPage(),
      binding: RegisterBinding(),
    ),
    //MAIN
    CustomRoutePage.getPage(
      routeName: AppRoutes().mainRoute,
      page: const MainPage(),
      binding: MainBinding(),
    ),
    CustomRoutePage.getPage(
      routeName: AppRoutes().notificationsRoute,
      page: const NotificationsPage(),
      binding: NotificationsBinding(),
    ),
    //Details
    CustomRoutePage.getPage(
      routeName: AppRoutes().travelDetailsRoute,
      page: const TravelDetailsPage(),
      binding: TravelDetailsBinding(),
    ),
  ];
}
