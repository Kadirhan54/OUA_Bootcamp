import 'package:get/get.dart';
import 'package:oua_bootcamp/app/data/client/api_client.dart';

class ApiClientBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyApiClient>(() => MyApiClient());
  }
}
