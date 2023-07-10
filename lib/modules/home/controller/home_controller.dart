import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:nfc_manager/nfc_manager.dart';

class HomeController extends GetxController {
  final _data = ''.obs;

  String get data => _data.value;
  set data(value) => _data.value = value;

  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  void onInit() {
    tagRead();
    // TODO: implement onInit
    super.onInit();
  }

  void tagRead() {
    NfcManager.instance.startSession(onDiscovered: (tag) async {
      result.value =
          await tag.data['ndef']['cachedMessage']['records'][0]['payload'];
      String s = String.fromCharCodes(result.value as Iterable<int>).toString();
      var outputAsUint8List = Uint8List.fromList(s.codeUnits);
      print('test: ${s.substring(3, s.length)}');
      _data.value = s.substring(3, s.length);
      var ndef = Ndef.from(tag);
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
