import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/home_controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            body: SlidingUpPanel(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              margin: const EdgeInsets.only(top: 35),
              minHeight: Get.height - Get.width - 40,
              maxHeight: Get.height,
              /// image
              body: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: SizedBox(
                                height: Get.width,
                                width: Get.width,
                                child: controller.userData.image!.isNotEmpty
                                    ? Image.memory(
                                        base64Decode(controller.image.toString()),
                                        fit: BoxFit.fill)
                                    : const FlutterLogo(
                                        size: 150,
                                      )),
                          ),
                        ],
                      ),
                    ],
                  )),
              /// information
              panelBuilder: (ScrollController sc) => scrollView(context, sc),
        )),
      ),
    );
  }

  Widget scrollView(BuildContext context, ScrollController sc) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        showLeading: false,
        showTrailing: false,
        axisDirection: AxisDirection.up,
        color: Colors.transparent,
        child: ListView(
          padding: EdgeInsets.zero,
          controller: sc,
          children: [
            Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.userData.name.toString(),
                    style: const TextStyle(
                        fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/edit', arguments: [
                        {
                          "nfcData": controller.nfcData,
                          "userData": controller.userData
                        }
                      ]);
                    },
                    icon: controller.userData.name!.isNotEmpty
                        ? const Icon(Icons.edit_note,
                        color: Colors.black, size: 30)
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(color: Colors.grey.shade300))),
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
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
            User(context),
          ],
        ),
      ),
    );
  }

  Widget Heavy(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => controller.userData.heavy!.isNotEmpty
              ? Text("${controller.userData.heavy.toString()}kg",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w500))
              : const Text(
                  '',
                  style: TextStyle(fontSize: 30),
                ),
        ),
        const Text(
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
