import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/search_controller.dart';

class SearchView extends GetView<SearchViewController> {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            height: Get.height / 22,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50)
            ),
            child: TextField(
              autofocus: true,
              onChanged: (value) => controller.runFilter(value),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Tìm kiếm dịch vụ và phòng khám',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  )
              ),
            ),
          ),
        ),
        actions: const [
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Obx(() => Column(
        children: [
          controller.searchResult.isNotEmpty
              ? Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.searchResult.length,
                  itemBuilder: (BuildContext context, int index) {
                      return shopList(index);
                  },
                ),
              )
              : const Text('Không tìm thấy kết quả')
        ],
      )),
    );
  }
  Widget shopList(index) {
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
            width: Get.width / 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.searchResult[index].name.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(controller.searchResult[index].rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), overflow: TextOverflow.ellipsis),
                  ],
                ),
                Text(controller.searchResult[index].description.toString(), style: const TextStyle(fontSize: 12), overflow: TextOverflow.clip, maxLines: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
