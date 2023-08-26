import 'package:get/get.dart';
import '../../../models/shop_data_model.dart';

class SearchViewController extends GetxController {
  dynamic argumentData = Get.arguments;

  final _shopData = <ShopDataModel>[].obs;
  final _searchResult = <ShopDataModel>[].obs;

  List<ShopDataModel> get shopData => _shopData;
  List<ShopDataModel> get searchResult => _searchResult;

  @override
  void onInit() {
    _shopData.value     = argumentData[0]['data'];
    _searchResult.value = _shopData;
    super.onInit();
  }

  void runFilter(String enteredKeyword) {
    List<ShopDataModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = _shopData;
    } else {
      results = _shopData.where((user) => user.name.toString().toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    _searchResult.value = results;
  }
}


