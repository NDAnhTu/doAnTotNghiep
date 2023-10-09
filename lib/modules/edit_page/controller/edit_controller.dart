import 'package:get/get.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:doantotnghiep/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';

class EditController extends GetxController {
  dynamic argumentData    = Get.arguments;
  final _localImage = false.obs;
  final _nfcData    = ''.obs;
  final _userData   = UserData(name: '', owner: '', image: '', phone_number: '', status: '', heavy: '', age: '', sex: '').obs;
  final _byteImage = ''.obs;

  bool   get localImage => _localImage.value;
  String get nfcData    => _nfcData.value;
  UserData get userData => _userData.value;
  String get byteImage => _byteImage.value;

  set localImage(value) => _localImage.value = value;
  set nfcData(value)    => _nfcData.value    = value;

  var db  = FirebaseFirestore.instance;

  TextEditingController name  = TextEditingController();
  TextEditingController heavy = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    _nfcData.value       = argumentData[0]['nfcData'];
    _userData.value      = argumentData[0]['userData'];
    name.text  = _userData.value.name!;
    heavy.text = _userData.value.heavy!;
  }

  Future<String?> cropImage(imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Pets',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Pets',
        ),
      ],
    );
    return croppedFile?.path.toString();
  }

  Future<void> uploadImage(filePath) async {
    Uint8List readFile = await File(filePath).readAsBytes();
    String imageBase64 = base64.encode(readFile);
    db.collection('pets').doc(_nfcData.value).update({"image": imageBase64});
  }
}


