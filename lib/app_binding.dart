import 'package:get/get.dart';
import 'modules/_auth/authen_service.dart';
import 'modules/home/controller/home_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectService();
  }

  void injectService() {
    Get.put(AuthenService());
    Get.put(HomeController());
  }
}
