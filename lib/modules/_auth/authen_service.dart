import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenService extends GetxService {
  var box = GetStorage();
  final userID = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userID.value = box.read('nfcData') ?? '1m6kc1nLyi9olQruQyVj';
  }
}
