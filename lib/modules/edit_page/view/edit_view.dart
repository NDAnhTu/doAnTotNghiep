import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/edit_controller.dart';
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

class EditView extends GetView<EditController> {
  EditView({Key? key}) : super(key: key);

  var image = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: const Text('Edit'),
      ),
      body: Obx(() => SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: controller.localImage ? Image.file(File(image.value)) : Image.memory(base64Decode(controller.userData.image.toString()), fit: BoxFit.fill),
              ),
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final imageTemp = await ImagePicker().pickImage(source: ImageSource.gallery);
                          if (imageTemp == null) return;
                          image.value = (await controller.cropImage(imageTemp.path))!;
                          if (imageTemp.toString().isEmpty) {
                            controller.localImage = false;
                          } else {
                            controller.localImage = true;
                          }
                        } on PlatformException catch (e) {
                          print('Failed to pick image: $e');
                        }
                      },
                      child: const Text('loadImage')),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        await Future.delayed(const Duration(
                            microseconds: 100))
                            .then((value) {
                          controller
                              .uploadImage(image.value);
                        });
                      },
                      child: const Text('uploadImage')),
                ),
              ],
            ),
            const SizedBox(
              height: 20 ,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: controller.name,
                decoration: const InputDecoration(
                    prefixText: 'Tên: '
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: controller.heavy,
                decoration: const InputDecoration(
                    prefixText: 'Cân nặng (kg): '
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
