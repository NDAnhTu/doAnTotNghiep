import 'package:get/get.dart';
import '../controller/thongtin_controller.dart';

class ThamKhamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThamKhamController>(() => ThamKhamController());
  }
}
