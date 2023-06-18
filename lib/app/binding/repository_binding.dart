import 'package:get/get.dart';
import 'package:oua_bootcamp/app/data/repository/repository.dart';

class RepositoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRepository>(
      () => MyRepository(),
    );
  }
}
