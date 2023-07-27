import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/chat/chat_binding.dart';
import 'package:oua_bootcamp/app/modules/chat/chat_page.dart';
import 'package:oua_bootcamp/app/modules/dashboard/dashboard_binding.dart';
import 'package:oua_bootcamp/app/modules/dashboard/dashboard_page.dart';
import 'package:oua_bootcamp/app/modules/post_page/post_page.dart';
import 'package:oua_bootcamp/app/modules/sign_in/sign_in_binding.dart';
import 'package:oua_bootcamp/app/modules/sign_in/sign_in_page.dart';
import 'package:oua_bootcamp/app/modules/post_page/post_page_binding.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.MAIN,
        page: () => const DashboardPage(),
        binding: DashboardBinding()),
    GetPage(
        name: Routes.SIGNIN,
        page: () => const SigInPage(),
        binding: SigInBinding()),
    GetPage(
        name: Routes.CHAT,
        page: () => const ChatPage(),
        binding: ChatBinding()),
    GetPage(
      name: Routes.POST,
      page: () => const PostPage(),
      binding: PostPageBinding(),
    ),
    // GetPage(
    //   name: Routes.TOPIC,
    //   page: () => const PostPage(),
    //   binding: PostPageBinding(),
    // ),
  ];
}
