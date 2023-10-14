import 'package:get/get.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:petcare/models/chatbotMessage.dart';

class ChatBotController extends GetxController {
  dynamic argumentData = Get.arguments;
  late DialogFlowtter dialogFlowtter;

  final _listMessage = <ChatBotMessageModel>[].obs;

  List<ChatBotMessageModel> get listMessage => _listMessage;



  @override
  void onInit() {
    DialogFlowtter.fromFile().then((value) => dialogFlowtter = value);
    super.onInit();
  }

  Future<void> sendMessage(String message, bool isUserMess) async {
    if (message.isEmpty) {
      print('Message empty');
    } else if (message.isNotEmpty && isUserMess == true) {
      ChatBotMessageModel data = ChatBotMessageModel(message: message, isUserMessage: true);
      _listMessage.add(data);
      DetectIntentResponse response = await dialogFlowtter.detectIntent(queryInput: QueryInput(text: TextInput(text: message)));
      if (response.text!.isNotEmpty) {
        ChatBotMessageModel data = ChatBotMessageModel(message: response.text, isUserMessage: false);
        _listMessage.add(data);
      }
    }
  }
}


