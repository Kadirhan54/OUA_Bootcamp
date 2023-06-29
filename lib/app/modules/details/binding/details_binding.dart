import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/details/controller/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );
  }
}
