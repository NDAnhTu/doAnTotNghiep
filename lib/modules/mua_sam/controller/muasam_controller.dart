import 'package:get/get.dart';
import '../../../models/shop_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MuaSamController extends GetxController {

  final List<String> imgList = [
    'assets/images/cs/1.jpg',
    'assets/images/cs/2.jpg',
    'assets/images/cs/3.jpg',
    'assets/images/cs/4.jpg',
    'assets/images/cs/5.jpg',
    'assets/images/cs/cs_6.jpg',
    'assets/images/cs/cs_7.jpg',
  ];
  final _shopData = <ShopDataModel>[].obs;

  List<ShopDataModel> get shopData => _shopData;

  var db = FirebaseFirestore.instance;
  @override
  void onInit() {
    db.collection("shop").get().then((value) {
      for (var docSnapshot in value.docs) {
        _shopData.add(ShopDataModel.fromJson(docSnapshot.data()));
      }
    },
      onError: (e) => print("Error completing: $e"),
    );
    super.onInit();
  }
}


