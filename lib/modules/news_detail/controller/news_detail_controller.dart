import 'dart:convert';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petcare/models/news_model.dart';
import 'package:petcare/models/tips_model.dart';

class NewsDetailController extends GetxController {
  dynamic argumentData = Get.arguments;
  final _newsList  = <NewsModel>[].obs;
  final _detailID  = ''.obs;
  final _title     = ''.obs;
  final _introduce = ''.obs;
  final _thumb     = ''.obs;
  final _loading   = true.obs;

  bool            get loading    => _loading.value;
  String          get title      => _title.value;
  String          get introduce  => _introduce.value;
  String          get thumb      => _thumb.value;
  List<NewsModel> get newsList   => _newsList;

  var db = FirebaseFirestore.instance;


  @override
  void onInit() {
    _loading.value = true;
    // TODO: implement onInit
    super.onInit();
    _detailID.value  = argumentData[0]['ID'];
    _title.value     = argumentData[0]['title'];
    _introduce.value = argumentData[0]['introduce'];
    _thumb.value     = argumentData[0]['thumb'];
    db.collection("tips").doc(_detailID.value).collection('detail').get().then((value) async {
      if(value.docs.isNotEmpty) {
        for (var news in value.docs) {
          NewsModel newsData = NewsModel();
          newsData    = NewsModel.fromJson(news.data());
          newsData.id = news.id;
          newsData.para = jsonDecode(news.data()["p"]);
          _newsList.add(newsData);
        }
      }
    });
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await Future.delayed(const Duration(milliseconds: 300));
    _loading.value = false;
  }
}


