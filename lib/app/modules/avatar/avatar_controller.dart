import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/entities/user.dart';
import 'package:oua_bootcamp/app/common/store/store.dart';
import 'package:oua_bootcamp/app/common/store/user.dart';
import 'package:oua_bootcamp/app/modules/profile/profile_controller.dart';

class AvatarController extends GetxController {
  static AvatarController instance = Get.find();

  final _avatarUrl = 'https://api.dicebear.com/6.x/adventurer/png?seed='.obs;
  get avatarUrl => _avatarUrl;
  set avatarUrl(value) => _avatarUrl.value = value;

  final db = FirebaseFirestore.instance;

  newAvatar() {
    String random = Random().nextInt(500).toString();
    avatarUrl(_avatarUrl + random);
    update();
  }

  submitAvatar() async {
    var user = await db
        .collection('users')
        .where('id', isEqualTo: UserStore.to.token)
        .get();

    // ignore: non_constant_identifier_names
    var doc_id = user.docs.first.id;
    db
        .collection('users')
        .doc(doc_id)
        .update({'avatarUrl': avatarUrl.toString()});

    ProfileController.instance.setUserAvatarUrl(avatarUrl.toString());

    String prof = await UserStore.to.getProfile();
    final profile = jsonDecode(prof);
    UserLoginResponseEntity userdata = UserLoginResponseEntity(
        accessToken: profile['access_token'],
        avatarUrl: avatarUrl.toString(),
        displayName: profile['display_name'],
        email: profile['email']);
    UserStore.to.saveProfile(userdata);

    update();
  }
}
