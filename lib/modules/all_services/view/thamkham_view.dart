import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/thamkham_controller.dart';

class AllServicesView extends GetView<AllServicesController> {
  AllServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: Get.width,
                width: Get.width,
                color: Colors.amber,
                child: Image.asset('assets/images/services/shop/1.jpg'),
              ),
              Positioned(
                left: 15,
                top: 45,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Row(
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.check_outlined, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Đã xác thực',
                  style: TextStyle(color: Colors.orange, fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
            child: SizedBox(
              width: Get.width,
              child: Text(
                  controller.shopData.name.toString(),
                  style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 15, left: 15),
            child: SizedBox(
              width: Get.width,
              height: Get.height / 9,
              child: Text(
                controller.shopData.description.toString(),
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Stack(
              children: [
                SizedBox(
                  width: Get.width,
                  height: 150,
                  child: Image.asset(
                    'assets/images/services/shop/map.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on, color: Colors.red, size: 30),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          controller.shopData.city.toString(),
                          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        controller.shopData.address.toString(),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
