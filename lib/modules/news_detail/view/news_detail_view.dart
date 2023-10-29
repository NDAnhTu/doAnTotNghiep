import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/theme/colors.dart';
import '../controller/news_detail_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  NewsDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[30],
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Thông tin chung', style: TextStyle(color: AppColors.newsColor, fontWeight: FontWeight.w700)),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.chevron_left_outlined, color: AppColors.newsColor, size: 30),
        ),
      ),
      body: Obx(() => Stack(
        children: [
          ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: AppColors.newsColor,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(controller.title.toString(),
                          style: const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(controller.introduce.toString(),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        height: 200,
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: MemoryImage(base64Decode(controller.thumb.toString())),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      Obx(() => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.newsList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(controller.newsList[index].title.toString(),
                                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold, color: AppColors.newsColor),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(controller.newsList[index].para![0].toString(),
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                                textAlign: TextAlign.justify,
                              ),
                              Container(
                                height: 180,
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                    image: MemoryImage(base64Decode(controller.newsList[index].image.toString())),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.newsList[index].para!.length - 1,
                                itemBuilder: (context, num) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(controller.newsList[index].para![num + 1].toString(),
                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                                        textAlign: TextAlign.justify,
                                        ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          controller.loading
              ? Container(
                  color: Colors.white,
                  child: Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                          color: AppColors.newsColor, size: 45)),
                )
              : const SizedBox(),
        ],
      )),
    );
  }
}
