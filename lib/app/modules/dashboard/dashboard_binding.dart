import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/add/add_controller.dart';
import 'package:oua_bootcamp/app/modules/avatar/avatar_controller.dart';
import 'package:oua_bootcamp/app/modules/contact/contact_controller.dart';
import 'package:oua_bootcamp/app/modules/dashboard/dashboard_controller.dart';
import 'package:oua_bootcamp/app/modules/discover/discover_controller.dart';
import 'package:oua_bootcamp/app/modules/home/home_controller.dart';
import 'package:oua_bootcamp/app/modules/profile/profile_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<DiscoverController>(
      () => DiscoverController(),
    );
    Get.lazyPut<AddController>(
      () => AddController(),
    );
    Get.lazyPut<ContactController>(
      () => ContactController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<AvatarController>(
      () => AvatarController(),
    );
  }
}
