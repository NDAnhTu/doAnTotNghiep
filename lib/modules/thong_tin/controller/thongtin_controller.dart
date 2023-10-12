import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petcare/models/tips_model.dart';

class ThamKhamController extends GetxController {

  final _tipsList = <TipsModel>[].obs;

  List<TipsModel> get tipsList => _tipsList;

  var db = FirebaseFirestore.instance;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    db.collection("tips").get().then((value) {
      if(value.docs.isNotEmpty) {
        for (var tips in value.docs) {
          TipsModel tipsData = TipsModel();
          tipsData    = TipsModel.fromJson(tips.data());
          tipsData.id = tips.id;
          _tipsList.add(tipsData);
        }
        _tipsList.shuffle();
      }
    });
  }
}


