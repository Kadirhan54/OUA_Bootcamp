import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/chat/controller/chat_controller.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
