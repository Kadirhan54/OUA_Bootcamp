import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/add/binding/add_binding.dart';
import 'package:oua_bootcamp/app/modules/auth/binding/auth_binding.dart';
import 'package:oua_bootcamp/app/binding/remote/api_client_binding.dart';
import 'package:oua_bootcamp/app/modules/chat/binding/chat_binding.dart';
import 'package:oua_bootcamp/app/modules/discover/binding/discover_binding.dart';
import 'package:oua_bootcamp/app/modules/home/binding/home_binding.dart';
import 'package:oua_bootcamp/app/modules/profile/binding/profile_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    ApiClientBinding().dependencies();
    AuthBinding().dependencies();
    HomeBinding().dependencies();
    DiscoverBinding().dependencies();
    AddBinding().dependencies();
    ChatBinding().dependencies();
    ProfileBinding().dependencies();

   
  }

  // @override
  // void dependencies() {
  //   RepositoryBindings().dependencies();
  //   RemoteSourceBindings().dependencies();
  //   LocalSourceBindings().dependencies();
  // }
}
