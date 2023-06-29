import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/auth/controller/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
