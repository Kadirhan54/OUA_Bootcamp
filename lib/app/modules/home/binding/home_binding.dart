import 'package:oua_bootcamp/app/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/home/views/post_view/post_view_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<PostViewController>(
      () => PostViewController(),
    );
  }
}
