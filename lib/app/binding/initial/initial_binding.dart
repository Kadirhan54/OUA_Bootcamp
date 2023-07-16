import 'package:get/get.dart';
import 'package:oua_bootcamp/app/binding/remote/api_client_binding.dart';
import 'package:oua_bootcamp/app/modules/dashboard/dashboard_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    ApiClientBinding().dependencies();
    DashboardBinding().dependencies();
  }

  // @override
  // void dependencies() {
  //   RepositoryBindings().dependencies();
  //   RemoteSourceBindings().dependencies();
  //   LocalSourceBindings().dependencies();
  // }
}
