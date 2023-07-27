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

  final baseAvatarUrl = 'https://api.dicebear.com/6.x/adventurer/png?seed=';

  final avatarUrl = ProfileController.instance.avatarUrl;

  final db = FirebaseFirestore.instance;

  // @override
  // onInit() {
  //   super.onInit();
  //  ProfileController.instance.getUserAvatarUrl();
  // }

  newRandomAvatar() {
    String random = Random().nextInt(500).toString();
    ProfileController.instance.setUserAvatarUrl(baseAvatarUrl + random);
    update();
  }

  submitAvatar() async {
    var user = await db
        .collection('users')
        .where('id', isEqualTo: UserStore.to.token)
        .get();

    var docId = user.docs.first.id;
    db
        .collection('users')
        .doc(docId)
        .update({'avatarUrl': avatarUrl.toString()});

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
