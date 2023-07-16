import 'dart:math';

import 'package:get/get.dart';

class AvatarController extends GetxController {
  static AvatarController instance = Get.find();

  final _avatarUrl = 'https://api.dicebear.com/6.x/adventurer/png?seed='.obs;
  get avatarUrl => _avatarUrl;
  set avatarUrl(value) => _avatarUrl.value = value;

  newAvatar() {
    String random = Random().nextInt(500).toString();
    avatarUrl(_avatarUrl + random);
    update();
  }

  submitAvatar() {

    // UserStore guncelle
    // Firebase guncelle
    // update

  }
}
