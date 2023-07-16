import 'dart:convert';

import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/store/user.dart';

class ProfileController extends GetxController {
  // Normalde empty string girdi fakat image.network'de hata veriyor.
  // O yuzden default deger giriyoruz. Zaten anlasilmiyor.
  final _avatarUrl = 'https://api.dicebear.com/6.x/adventurer/png?seed='.obs;
  get avatarUrl => _avatarUrl;
  set avatarUrl(value) => _avatarUrl.value = value;

  @override
  onInit() {
    super.onInit();
    getUserAvatarUrl();
  }

  getUserAvatarUrl() async {
    final prof = await UserStore.to.getProfile();
    final avatar = jsonDecode(prof)['avatarUrl'];
    avatarUrl(avatar);
    update();
  }
}
