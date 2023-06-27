import 'package:get/get.dart';
import 'package:oua_bootcamp/app/binding/auth/auth_binding.dart';
import 'package:oua_bootcamp/app/binding/remote/api_client_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    ApiClientBinding().dependencies();
    AuthBinding().dependencies();
  }

  // @override
  // void dependencies() {
  //   RepositoryBindings().dependencies();
  //   RemoteSourceBindings().dependencies();
  //   LocalSourceBindings().dependencies();
  // }
}
