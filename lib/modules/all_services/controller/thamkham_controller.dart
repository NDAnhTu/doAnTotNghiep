import 'package:get/get.dart';
import '../../../models/shop_data_model.dart';

class AllServicesController extends GetxController {
  dynamic argumentData = Get.arguments;
  final _shopData = ShopDataModel().obs;
  final _services = ServicesModel().obs;

  ShopDataModel get shopData => _shopData.value;
  ServicesModel get services => _services.value;

  @override
  void onInit() {
    super.onInit();
    _shopData.value = argumentData[0]["shopData"];
    _services.value = argumentData[0]["services"];
  }
}


