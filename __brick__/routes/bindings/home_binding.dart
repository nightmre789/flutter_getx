import 'package:get/get.dart';

import 'package:{{name}}}/controllers/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // dependency injection
    Get.lazyPut<HomeController>(() => HomeController());
    // can also Get.Put() or Get.lazyPut() services, other common controllers, etc.
  }
}
