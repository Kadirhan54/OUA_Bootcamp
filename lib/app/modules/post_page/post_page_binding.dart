import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/post_page/post_page_controller.dart';

class PostPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostPageController>(
      () => PostPageController(),
    );
  }
}
