import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/binding/initial/initial_binding.dart';
import 'package:oua_bootcamp/app/common/services/services.dart';
import 'package:oua_bootcamp/app/common/store/store.dart';
import 'package:oua_bootcamp/app/routes/app_pages.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'app/theme/app_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() => StorageService().init());
  Get.put<ConfigStore>(ConfigStore());
  Get.put<UserStore>(UserStore());
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // await preferences.clear();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SIGNIN,
      initialBinding: InitialBinding(),
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      // locale: Locale('pt', 'BR'),
      // translationsKeys: AppTranslation.translations,
    ),
  );
}
