import 'package:get/get.dart';
import 'package:oua_bootcamp/app/binding/page_bindings/details_binding.dart';
import 'package:oua_bootcamp/app/binding/page_bindings/home_binding.dart';
import 'package:oua_bootcamp/app/ui/details/details_page.dart';
import 'package:oua_bootcamp/app/ui/home/home_page.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.DETAILS,
        page: () => const DetailsPage(),
        binding: DetailsBinding()),
  ];
}
