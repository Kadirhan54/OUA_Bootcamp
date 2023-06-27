import 'package:get/get.dart';
import 'package:oua_bootcamp/app/controller/main/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
}
