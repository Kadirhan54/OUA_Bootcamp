import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/sign_in/sing_in_controller.dart';

class SigInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigInController>(
      () => SigInController(),
    );
  }
}
