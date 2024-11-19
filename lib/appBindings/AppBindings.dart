import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_12/Controllers/Dashboard_controller.dart';

class Appbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}