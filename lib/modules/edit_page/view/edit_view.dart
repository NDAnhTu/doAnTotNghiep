import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/edit_controller.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class EditView extends GetView<EditController> {
  EditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.chevron_left, size: 30, color: Colors.black),
        ),
        centerTitle: true,
        title: const Text('Chỉnh sửa thông tin', style: TextStyle(color: Colors.black)),
      ),
      body: Obx(() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            
            /// image
            Center(
              child: Container(
                height: 300,
                width: 300,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 2, color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(20),
                  image: controller.localImage
                    ? DecorationImage(image: FileImage(File(controller.image)), fit: BoxFit.fill)
                    : DecorationImage(image: MemoryImage(base64Decode(controller.userData.image.toString())), fit: BoxFit.fill)
                  ),
              ),
            ),

            /// load image button
            Center(
              child: TextButton(
                  onPressed: () async {
                    try {
                      final imageTemp = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (imageTemp == null) return;
                      controller.image = (await controller.cropImage(imageTemp.path))!;
                      if (imageTemp.toString().isEmpty) {
                        controller.localImage = false;
                      } else {
                        controller.localImage = true;
                      }
                    } on PlatformException catch (e) {
                      print('Failed to pick image: $e');
                    }
                  },
                  child: const Text('Edit picture', style: TextStyle(fontSize: 18),)),
            ),
            const Divider(),
            const SizedBox(
              height: 20 ,
            ),

            /// name
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text('Tên thú cưng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: TextFormField(
                controller: controller.name,
                focusNode: controller.nameFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(controller.heavyFocusNode);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20 ,
            ),

            /// heavy
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text('Cân nặng (kg)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: TextFormField(
                keyboardType: const TextInputType.numberWithOptions(signed: true),
                focusNode: controller.heavyFocusNode,
                controller: controller.heavy,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30 ,
            ),

            /// upload button
            Center(
              child: InkWell(
                onTap: () {
                  controller.uploadImage(controller.image);
                },
                child: Container(
                  width: Get.width - 70,
                  height: Get.height / 16,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Obx(() => controller.loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Cập nhật', style: TextStyle(fontSize: 19, color: Colors.white),),
                    )
                  ),
                ),
              ),
              ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      )),
    );
  }
}
