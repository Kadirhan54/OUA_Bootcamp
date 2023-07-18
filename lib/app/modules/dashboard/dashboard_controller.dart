// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();

  final _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;
  set tabIndex(value) => _tabIndex.value = value;

  // late final List<String> tabTitles;
  // late final PageController pageController;
  // late final List<BottomNavigationBarItem> bottomTabs;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }


  @override
  void dispose() {
    // pageController.dispose();
    super.dispose();
  }
}
