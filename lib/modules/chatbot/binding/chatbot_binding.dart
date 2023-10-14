import 'package:get/get.dart';
import '../controller/chatbot_controller.dart';

class ChatBotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatBotController>(() => ChatBotController());
  }
}
