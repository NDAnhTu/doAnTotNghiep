import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/home_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final test = <String, String>{
    "age": "8",
    "heavy": "2.5kg",
    "image": '',
    "name": "con meo",
    "owner": "con meo me",
    "phone_number": "123",
    "sex": "Đực",
    "status": "none",
  };
  var image = ''.obs;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          //bottomNavigationBar: bottomNavigator(),
          body: Stack(
            children: [
              Obx(() => Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: SizedBox(
                                height: 400,
                                child: controller.localImage == true
                                    ? image.value == ''
                                    ? const FlutterLogo(size: 170)
                                    : Image.file(File(image.value),
                                    fit: BoxFit.fill)
                                    : controller.byteImage == ''
                                    ? const FlutterLogo(size: 170)
                                    : Image.memory(
                                    base64Decode(controller
                                        .userData.image
                                        .toString()),
                                    fit: BoxFit.fill)),
                          ),
                          Positioned(
                            top: 270,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        try {
                                          final imageTemp =
                                          await ImagePicker().pickImage(
                                              source:
                                              ImageSource.gallery);
                                          controller.localImage = true;
                                          if (imageTemp == null) return;
                                          image.value = (await controller.cropImage(imageTemp.path))!;
                                        } on PlatformException catch (e) {
                                          print('Failed to pick image: $e');
                                        }
                                      },
                                      child: Text('loadImage')),
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
                                      child: Text('uploadImage')),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ))),
              Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          controller.userData.name.toString(),
                          style: const TextStyle(
                              fontSize: 38, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade300))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Heavy(context),
                            Age(context),
                            Sex(context),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      User(context)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Heavy(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text(
              controller.userData.heavy.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            )),
        Text(
          'Cân Nặng',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  Widget Age(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text(
              controller.userData.age.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            )),
        Text(
          'Tháng Tuổi',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  Widget Sex(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text(
              controller.userData.sex.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            )),
        Text(
          'Giới Tính',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  Widget User(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Họ và Tên chủ:',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        SizedBox(
          height: 5,
        ),
        Obx(
          () => Text(
            controller.userData.owner.toString(),
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Số điện thoại',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        SizedBox(
          height: 5,
        ),
        Obx(
          () => Text(
            controller.userData.phone_number.toString(),
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Thông tin thú cưng:',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          ' - Khám lần 1: Bỏ ăn, sốt',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w500, color: Colors.red),
        ),
        Text(
          ' - Chuẩn đoán: Nhiễm kí sinh',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w500, color: Colors.red),
        ),
      ],
    );
  }
}
