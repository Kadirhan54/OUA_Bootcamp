import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/entities/post.dart';
import 'package:oua_bootcamp/app/common/store/user.dart';
// import 'package:oua_bootcamp/app/modules/sign_in/sing_in_controller.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find<ProfileController>();

  // Normalde empty string girdi fakat image.network'de hata veriyor.
  // O yuzden default deger giriyoruz. Zaten anlasilmiyor.
  final _avatarUrl = 'https://api.dicebear.com/6.x/adventurer/png?seed='.obs;
  get avatarUrl => _avatarUrl;
  set avatarUrl(value) => _avatarUrl.value = value;

  RxBool isLoading = false.obs;

  final db = FirebaseFirestore.instance;

  final userOwnedPostsList = List<PostData>.empty(growable: true).obs;

  @override
  onInit() {
    super.onInit();
    getUserAvatarUrl();
    getUserOwnedPosts();
  }

  handleLogOut() async {
    // !!
    await FirebaseAuth.instance.signOut();
    // SigInController.instance.googleSignIn.signOut();
  }

  getUserAvatarUrl() async {
    isLoading(true);
    final prof = await UserStore.to.getProfile();
    final avatar = jsonDecode(prof)['avatarUrl'];
    avatarUrl(avatar);
    isLoading(false);
    update();
  }

  setUserAvatarUrl(value) {
    avatarUrl(value);
    update();
  }

  getUserOwnedPosts() async {
    isLoading(true);
    String profile = await UserStore.to.getProfile();
    var userId = jsonDecode(profile)['access_token'];

    QuerySnapshot<PostData> postBase = await db
        .collection('posts')
        .where('user_id', isEqualTo: userId)
        .withConverter(
            fromFirestore: PostData.fromFirestore,
            toFirestore: (PostData postData, options) => postData.toFirestore())
        .get();

    userOwnedPostsList.clear();

    for (var doc in postBase.docs) {
      userOwnedPostsList.add(doc.data());
    }
    isLoading(false);
    update();
  }
}
