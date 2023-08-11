import 'package:doantotnghiep/theme/colors.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controller/home_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final test = <String, String>{
    "name": "con meo",
    "owner": "con meo me",
    "phone_number": "123",
    "status": "none",
  };

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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/test_1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          controller.userData.name.toString(),
                          style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Heavy(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() =>
          Text(
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
        Obx(() =>
            Text(
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
        Obx(() =>
            Text(
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
        Obx(() => Text(
          controller.userData.phone_number.toString(),
          style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700),
        ),),
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
