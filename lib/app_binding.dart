import 'package:doantotnghiep/modules/dich_vu/controller/dichvu_controller.dart';
import 'package:doantotnghiep/modules/main/controller/main_controller.dart';
import 'package:doantotnghiep/modules/mua_sam/controller/muasam_controller.dart';
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
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(DichVuController());
    Get.put(MuaSamController());
  }
}
