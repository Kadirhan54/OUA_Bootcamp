import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/profile/controller/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
