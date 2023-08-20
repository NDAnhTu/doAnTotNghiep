import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dichvu_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DichVuView extends GetView<DichVuController> {
  DichVuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.location_on_rounded, color: Colors.red,),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Địa chỉ của bạn', style: TextStyle(color: Colors.grey, fontSize: 13),),
            Text('ĐH Sư Phạm Kĩ Thuật', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
          ],
        ),
        titleSpacing: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///--- image
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: Get.height / 4.1,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                ),
                items: controller.imgList
                    .map((item) => Center(
                        child: Image.asset(item, fit: BoxFit.fill)))
                    .toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
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
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 110,
              ),
              children: [
                select('assets/images/services/spa.png', 'Spa'),
                select('assets/images/services/doctor.png', 'Khám bệnh'),
                select('assets/images/services/phauthuat.png', 'Phẫu thuật'),
                select('assets/images/services/hotel.png', 'Khách sạn'),
                select('assets/images/services/vaccine.png', 'Tiêm phòng'),
                select('assets/images/services/another.png', 'Cơ sở'),
              ],
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/services/adop.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
            ),
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.shopData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: Get.height / 8.5,
                      margin: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            height: Get.height / 8.5,
                            width: Get.height / 8.5,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: Get.width / 1.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.shopData[index].name.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), overflow: TextOverflow.ellipsis),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(controller.shopData[index].rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                                Text(controller.shopData[index].description.toString(), style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis, maxLines: 2),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget select(String image, String text) {
  return SizedBox(
    height: 50,
    child: Column(
      children: [
        Image.asset(image, fit: BoxFit.contain, height: 75,),
        Text(text),
      ],
    ),
  );
}
