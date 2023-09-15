import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/muasam_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MuaSamView extends GetView<MuaSamController> {
  MuaSamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Shop'),
        actions: const [
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed('/search', arguments: [{"data": controller.shopData}]);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20),
                height: Get.height / 19,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    Text(' Tìm kiếm dịch vụ và phòng khám')
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: Get.height / 4.1,
                  autoPlay: true,
                  viewportFraction: 0.85,
                  enlargeCenterPage: true,
                ),
                items: controller.imgList
                    .map((item) => Center(
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                           Radius.circular(20)
                          )
                        ),
                        child: Image.asset(item, fit: BoxFit.fill))))
                    .toList(),
              ),
            ),
            GridView(
                padding: const EdgeInsets.only(left: 20, right: 20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 120,
                ),
                children: [
                  select('assets/images/shop/cat-food.png', 'Thức ăn cho mèo'),
                  select('assets/images/shop/dog-food.png', 'Thức ăn cho chó'),
                  select('assets/images/shop/pet-treat.png', 'Đồ thưởng'),
                  select('assets/images/shop/shower-gel.png', 'Sữa tắm'),
                  select('assets/images/shop/pet-supplies.png', 'Đồ dùng phụ kiện'),
                  select('assets/images/shop/dog.png', 'Chó'),
                  select('assets/images/shop/cat.png', 'Mèo'),
                  select('assets/images/services/another.png', 'Cơ sở'),
                ],
              ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Phụ kiện thú cưng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  TextButton(
                      child: const Text('Xem tất cả'),
                    onPressed: () {
                        print('1111');
                    },
                  ),
                ],
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.shopData.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.amber,
                  width: 150,
                  height: 150,
                  child: const Column(
                    children: [
                      FlutterLogo(
                        size: 100,
                      )
                    ],
                  ),
                );
              },
            )
        ],
        ),
      ),
    );
  }
  Widget select(String image, String text) {
    return SizedBox(
      height: 45,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade100,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Image.asset(image, fit: BoxFit.contain, height: 55)),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
