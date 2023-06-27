import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/binding/initial/initial_binding.dart';
import 'package:oua_bootcamp/app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      initialBinding: InitialBinding(),
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      // locale: Locale('pt', 'BR'),
      // translationsKeys: AppTranslation.translations,
    ),
  );
}

