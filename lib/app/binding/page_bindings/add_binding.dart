import 'package:get/get.dart';
import 'package:oua_bootcamp/app/controller/add/add_controller.dart';

class AddBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddController>(
      () => AddController(),
    );
  }
}
