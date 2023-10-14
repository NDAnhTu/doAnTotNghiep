import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/modules/chatbot/controller/chatbot_controller.dart';

import '../../../theme/colors.dart';

class ChatBotView extends GetView<ChatBotController> {
  ChatBotView({Key? key}) : super(key: key);

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: const Text('ChatBot', style:  TextStyle(color: Colors.black, fontSize: 25),),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.chevron_left, size: 30, color: Colors.black),
        ),
      ),
      body: Obx(() => Column(
        children: [
          Expanded(child: Message()),
          Container(
            color: Colors.purple.shade50,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            // color: Colors.deepPurple,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        controller.sendMessage(inputController.text, true);
                        inputController.clear();
                      },
                      controller: inputController,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      controller.sendMessage(inputController.text, true);
                      inputController.clear();
                    },
                    child: Icon(Icons.send, color: AppColors.primaryColor)),
              ],
            ),
          )
        ],
      )),
    );
  }
  Widget Message() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: controller.listMessage.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: controller.listMessage[index].isUserMessage.toString() == 'true'
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                    child: Text(
                      controller.listMessage[index].message.toString(),
                      maxLines: 20,
                      textAlign: controller.listMessage[index].isUserMessage.toString() == 'true' ? TextAlign.end : TextAlign.start,
                    ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
