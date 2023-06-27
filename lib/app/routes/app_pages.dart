import 'package:get/get.dart';
import 'package:oua_bootcamp/app/binding/main/main_binding.dart';
import 'package:oua_bootcamp/app/binding/page_bindings/add_binding.dart';
import 'package:oua_bootcamp/app/binding/page_bindings/chat_binding.dart';
import 'package:oua_bootcamp/app/binding/page_bindings/discover_binding.dart';
import 'package:oua_bootcamp/app/binding/page_bindings/home_binding.dart';
import 'package:oua_bootcamp/app/binding/page_bindings/profile_binding.dart';
import 'package:oua_bootcamp/app/ui/add/add_page.dart';
import 'package:oua_bootcamp/app/ui/chat/chat_page.dart';
import 'package:oua_bootcamp/app/ui/discover/discover_page.dart';
import 'package:oua_bootcamp/app/ui/home/home_page.dart';
import 'package:oua_bootcamp/app/ui/main/main_page.dart';
import 'package:oua_bootcamp/app/ui/profile/profile_page.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const MainPage(),
        binding: MainBinding()),
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.DISCOVER,
        page: () => const DiscoverPage(),
        binding: DiscoverBinding()),
    GetPage(
        name: Routes.ADD, page: () => const AddPage(), binding: AddBinding()),
    GetPage(
        name: Routes.CHAT,
        page: () => const ChatPage(),
        binding: ChatBinding()),
    GetPage(
        name: Routes.PROFILE,
        page: () => const ProfilePage(),
        binding: ProfileBinding()),
  ];
}
