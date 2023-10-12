import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/thamkham_controller.dart';

class ThamKhamView extends GetView<ThamKhamController> {
  ThamKhamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[30],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Thông tin chung', style: TextStyle(color: Color.fromARGB(255, 1, 133, 102), fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Center(
                  child: Text('Kiến Thức Chăm Sóc Thú Cưng Tổng Quan',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Center(
                  child: Text('Kiến thức và kinh nghiệm chăm sóc thú cưng, chó mèo, địa chỉ phòng khám uy tín, những điều cần biết khi mới nuôi thú cưng....',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.justify,
                  ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.tipsList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                          image: DecorationImage(
                            image: MemoryImage(base64Decode(controller.tipsList[index].thumb.toString())),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('THÔNG TIN CHUNG', style: TextStyle(color: Color.fromARGB(255, 1, 133, 102), fontSize: 15, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(controller.tipsList[index].title.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(controller.tipsList[index].introduce.toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300), textAlign: TextAlign.justify),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
