import 'package:doantotnghiep/models/shop_data_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DichVuController extends GetxController {
  @override

  final List<String> imgList = [
    'assets/images/cs/cs_1.jpg',
    'assets/images/cs/cs_2.jpg',
    'assets/images/cs/cs_3.jpg',
    'assets/images/cs/cs_4.jpg',
    'assets/images/cs/cs_5.jpg',
    'assets/images/cs/cs_6.jpg',
    'assets/images/cs/cs_7.jpg',
  ];

  final _shopData = <ShopDataModel>[].obs;
  final _services = <ServicesModel>[].obs;

  List<ShopDataModel> get shopData => _shopData;
  List<ServicesModel> get services => _services;

  var db = FirebaseFirestore.instance;

  @override
  void onInit() {
    db.collection("shop").get().then((value) {
        for (var docSnapshot in value.docs) {
          _shopData.add(ShopDataModel.fromJson(docSnapshot.data()));
          db.collection("shop").doc(docSnapshot.id).collection("services").get().then((data) {
            if (data.docs.isNotEmpty) {
              for (var servicesData in data.docs) {
                _services.add(ServicesModel.fromJson(servicesData.data()));
                print(servicesData.data());
              }
            } else {
              print('document do not have data');
            }
          });
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    super.onInit();
  }
}


