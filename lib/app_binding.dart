import 'package:get/get.dart';
import 'package:petcare/modules/tham_kham/controller/thamkham_controller.dart';
import 'modules/_auth/authen_service.dart';
import 'modules/dich_vu/controller/dichvu_controller.dart';
import 'modules/home/controller/home_controller.dart';
import 'modules/main/controller/main_controller.dart';
import 'modules/mua_sam/controller/muasam_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectService();
  }

  void injectService() {
    Get.put(AuthenService());
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(DichVuController());
    Get.put(MuaSamController());
    Get.put(ThamKhamController());
  }
}
