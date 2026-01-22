import 'package:get/get.dart';

import '../../features/spalsh_and_login/view/screen/splash_screen.dart';
import '../../features/1st_screen/controller/first_screen_controller.dart';
import '../../features/1st_screen/view/screen/first_screen.dart';
import '../../features/second_screen/controller/second_screen_controller.dart';
import '../../features/second_screen/view/screen/second_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String firstScreen = '/1st_screen';
  static const String secondScreen = '/2nd_screen';

  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: firstScreen,
      page: () => const FirstScreen(),
      binding: BindingsBuilder(() {
        Get.put(FirstScreenController());
      }),
    ),
    GetPage(
      name: secondScreen,
      page: () => const SecondScreen(),
      binding: BindingsBuilder(() {
        Get.put(SecondScreenController());
      }),
    ),
  ];
}
