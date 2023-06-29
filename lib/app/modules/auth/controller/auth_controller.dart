import 'package:get/get.dart';
import 'package:oua_bootcamp/app/data/client/api_client.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  MyApiClient apiClient = Get.find<MyApiClient>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
