import 'package:get/get.dart';
import '../controller/muasam_controller.dart';

class ThamKhamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MuaSamController>(() => MuaSamController());
  }
}
