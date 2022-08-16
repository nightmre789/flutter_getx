import 'package:get/get.dart';

class HomeController extends GetxController {
  final _count = 0.obs;

  int get count => _count.value;
  set count(int i) => _count.value = i;

  incrementCount() => count++;
}
