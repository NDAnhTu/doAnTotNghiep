import 'package:get/get.dart';
import '../controller/dichvu_controller.dart';

class DichVuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DichVuController>(() => DichVuController());
  }
}
