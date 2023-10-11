import 'package:get/get.dart';
import '../../../models/schedule_model.dart';
import '../../../models/shop_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../_auth/authen_service.dart';

class AllServicesController extends GetxController {
  final auth       = Get.find<AuthenService>();
  dynamic argumentData = Get.arguments;
  final _shopData = ShopDataModel().obs;
  final _services = ServicesModel().obs;
  final _schedule = <ScheduleModel>[].obs;


  ShopDataModel       get shopData => _shopData.value;
  ServicesModel       get services => _services.value;
  List<ScheduleModel> get schedule => _schedule;

  var db = FirebaseFirestore.instance;


  @override
  void onInit() {
    super.onInit();
    _shopData.value = argumentData[0]["shopData"];
    _services.value = argumentData[0]["services"];
    listener();
    db.collection("shop").doc(_shopData.value.id).collection('schedule').get().then((value) {
      if(value.docs.isNotEmpty) {
        for (var servicesData in value.docs) {
          _schedule.add(ScheduleModel.fromJson(servicesData.data()));
        }
      }
    });
  }

  Future<void> listener() async {
    db.collection("shop").doc(_shopData.value.id).collection('schedule').snapshots(includeMetadataChanges: true).listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            break;
          case DocumentChangeType.modified:
            var data = change.doc.data();
            _schedule[int.parse(change.doc.id)] = ScheduleModel.fromJson(data!);
            break;
          case DocumentChangeType.removed:
            print("3333");
            break;
        }
      }
    });
  }

  void updateSchedule(index) {
    if (_schedule[index].customer_id.toString() == '') {
      _schedule[index].customer_id = auth.userID.value;
      db.collection('shop').doc(_shopData.value.id).collection('schedule').doc(index.toString()).update({"customer_id": auth.userID.value});
    } else {
      _schedule[index].customer_id = '';
      db.collection('shop').doc(_shopData.value.id).collection('schedule').doc(index.toString()).update({"customer_id": ''});
    }
  }

}


