import 'package:get/get.dart';

import 'bindings/bindings.dart';
import '../pages/pages.dart';

import 'package:{{name}}/constants/common/string_constants.dart';

class Routes {
  static const home = homeRoute;
  static const other = otherRoute;

  // place logic here for determining initial route
  // eg. static String get initialRoute => isAuthenticated ? home : login;
  static String get initialRoute => home;

  static List<GetPage> routes = [
    // page with binding
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    // basic page without any binding
    GetPage(
      name: Routes.other,
      page: () => const OtherPage(),
    ),
  ];
}
