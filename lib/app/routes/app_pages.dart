import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/home/views/post_view/post_view.dart';
import 'package:oua_bootcamp/app/modules/main/binding/main_binding.dart';
import 'package:oua_bootcamp/app/modules/add/binding/add_binding.dart';
import 'package:oua_bootcamp/app/modules/chat/binding/chat_binding.dart';
import 'package:oua_bootcamp/app/modules/discover/binding/discover_binding.dart';
import 'package:oua_bootcamp/app/modules/home/binding/home_binding.dart';
import 'package:oua_bootcamp/app/modules/profile/binding/profile_binding.dart';
import 'package:oua_bootcamp/app/modules/add/ui/add_page.dart';
import 'package:oua_bootcamp/app/modules/chat/ui/chat_page.dart';
import 'package:oua_bootcamp/app/modules/discover/ui/discover_page.dart';
import 'package:oua_bootcamp/app/modules/home/ui/home_page.dart';
import 'package:oua_bootcamp/app/modules/main/ui/main_page.dart';
import 'package:oua_bootcamp/app/modules/profile/ui/profile_page.dart';
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
    GetPage(
        name: Routes.HOME_POST_VIEW,
        page: () => const PostView(),
        ),
  ];
}
