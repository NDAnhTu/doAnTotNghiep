import 'package:get/get.dart';
import '../controller/all_services_controller.dart';

class AllServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllServicesController>(() => AllServicesController());
  }
}
