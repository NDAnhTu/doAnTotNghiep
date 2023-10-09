import 'package:get/get.dart';

import '../controller/edit_controller.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditController>(() => EditController());
  }
}
