import 'package:get/get.dart';

import '../screens/home/home.view.dart';
import '../screens/initial/initial.view.dart';
import '../screens/login/login.view.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => InitialScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
    ),
  ];
}