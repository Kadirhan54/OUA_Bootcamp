import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/contact/contact_controller.dart';

class ContactBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(
      () => ContactController(),
    );
  }
}
