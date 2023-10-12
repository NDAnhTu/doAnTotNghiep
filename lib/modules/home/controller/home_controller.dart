import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/user_data_model.dart';
import '../../_auth/authen_service.dart';

class HomeController extends GetxController {
  final auth       = Get.find<AuthenService>();
  final _nfcData = ''.obs;
  final _userData = UserData(name: '', owner: '', image: '', phone_number: '', status: '', heavy: '', age: '', sex: '').obs;
  final _imagePath = ''.obs;
  final _byteImage = ''.obs;
  final _localImage = true.obs;
  final _image = ''.obs;
  final _loading = false.obs;
  var box = GetStorage();


  final storageRef = FirebaseStorage.instance.ref();

  String get imagePath => _imagePath.value;
  String get nfcData => _nfcData.value;
  UserData get userData => _userData.value;
  String get byteImage => _byteImage.value;
  String get image => _image.value;
  bool get localImage => _localImage.value;
  bool get loading => _loading.value;

  set nfcData(value) => _nfcData.value = value;
  set imagePath(value) => _imagePath.value = value;
  set localImage(value) => _localImage.value = value;
  set userData(value) => _userData.value = value;

  var db  = FirebaseFirestore.instance;
  var nfc = NfcManager.instance;

  ImagePicker picker = ImagePicker();
  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  Future<void> onInit() async {
    await loadDataFromLocalStorage().then((value) async {
      listener();
      if (value == false) {
        await checkNFC();
      }
    });
    super.onInit();
  }

  Future<void> checkNFC() async {
    if (await nfc.isAvailable()) {
      tagRead();
      listener();
    } else {
      Get.dialog(
        AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: const Text(""),
          content: const Text("NFC not available"),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
              },
              child: const Text("OK", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            ),
          ],
        ),
      );
    }
  }

  Future<bool> loadDataFromLocalStorage() async {
    if (auth.userID.isNotEmpty) {
      _nfcData.value = auth.userID.value;
      auth.userID.value = _nfcData.value;
      var docRef = db.collection('pets').doc(_nfcData.value);
      docRef.get().then((value) {
        _userData.value = UserData.fromJson(value.data() as Map<String, dynamic>);
        _image.value = _userData.value.image!;
        if (_userData.value.image.toString() == '') {
          _localImage.value = true;
        } else {
          _byteImage.value = _userData.value.image.toString();
          _localImage.value = false;
        }
      });
      return true;
    } else {
      return false;
    }
  }

  void tagRead() {
    NfcManager.instance.startSession(onDiscovered: (tag) async {
      result.value = await tag.data['ndef']['cachedMessage']['records'][0]['payload'];
      String id = String.fromCharCodes(result.value as Iterable<int>).toString();
      //var outputAsUint8List = Uint8List.fromList(id.codeUnits);
      //print('test: ${id.substring(3, id.length)}');
      _nfcData.value = id.substring(3, id.length);
      auth.userID.value = _nfcData.value;
      await box.write('nfcData', _nfcData.value.toString()).then((value) {
        if (Platform.isIOS) {
          stopRead();
        }
      });
      var docRef = db.collection('pets').doc(_nfcData.value);
      docRef.get().then((value) {
        _userData.value = UserData.fromJson(value.data() as Map<String, dynamic>);
        _image.value = _userData.value.image!;
        if (_userData.value.image.toString() == '') {
          _localImage.value = true;
        } else {
          _byteImage.value = _userData.value.image.toString();
          _localImage.value = false;
        }
      });
      //var ndef = Ndef.from(tag);
      //NfcManager.instance.stopSession();
    });
    // NfcManager.instance.startSession(onDiscovered: (tag) async {
    //   Ndef? ndef = Ndef.from(tag);
    //   try {
    //     if (ndef?.cachedMessage != null) {
    //       var ndefMessage = ndef?.cachedMessage!;
    //       if (ndefMessage!.records.isNotEmpty &&
    //           ndefMessage.records.first.typeNameFormat ==
    //               NdefTypeNameFormat.nfcWellknown) {
    //         print('2222');
    //         print(tag.data);
    //         final wellKnownRecord = ndefMessage.records.first;
    //         if (wellKnownRecord.payload.first == 0x02) {
    //           print('3333');
    //           final languageCodeAndContentBytes =
    //               wellKnownRecord.payload.skip(1).toList();
    //           final languageCodeAndContentText =
    //               utf8.decode(languageCodeAndContentBytes);
    //           final payload = languageCodeAndContentText.substring(2);
    //           final storedCounters = int.tryParse(payload);
    //           if (storedCounters != null) {
    //             print("Success!");
    //             print('Counter restored from tag');
    //           }
    //         }
    //       } else {
    //         print(tag.data);
    //       }
    //     }
    //     if (Platform.isIOS) {
    //       NfcManager.instance.stopSession();
    //     }
    //   } catch (e) {
    //     print("Tag isn't valid");
    //   }
    // });
  }

  void stopRead() {
    NfcManager.instance.stopSession();
  }

  Future<void> listener() async {
    db.collection("pets").snapshots(includeMetadataChanges: true).listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            break;
          case DocumentChangeType.modified:
            var data = change.doc.data();
            _userData.value = UserData.fromJson(data!);
            _image.value = change.doc.data()!["image"];
            break;
          case DocumentChangeType.removed:
            print("3333");
            break;
        }
      }
    });
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

  void ndefWrite() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createText('AnhTu'),
        // NdefRecord.createUri(Uri.parse('https://flutter.dev')),
        // NdefRecord.createMime(
        //     'text/plain', Uint8List.fromList('Hello'.codeUnits)),
        // NdefRecord.createExternal(
        //     'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Success to "Ndef Write"';
        // NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}


