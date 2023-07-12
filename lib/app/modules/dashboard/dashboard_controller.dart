import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;
  set tabIndex(value) => _tabIndex.value = value;

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabTitles = ['Home', 'Discover', 'Add', 'Chat', 'Profile'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Discover'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
          ),
          label: 'Chat'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
          ),
          label: 'Add'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.people,
          ),
          label: 'Profile'),
    ];

    pageController = PageController(initialPage: tabIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
