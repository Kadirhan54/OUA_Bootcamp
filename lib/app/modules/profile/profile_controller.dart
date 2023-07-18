import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/entities/post.dart';
import 'package:oua_bootcamp/app/common/entities/user.dart';
import 'package:oua_bootcamp/app/common/store/user.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find<ProfileController>();

  // Normalde empty string girdi fakat image.network'de hata veriyor.
  // O yuzden default deger giriyoruz. Zaten anlasilmiyor.
  final _avatarUrl = 'https://api.dicebear.com/6.x/adventurer/png?seed='.obs;
  get avatarUrl => _avatarUrl;
  set avatarUrl(value) => _avatarUrl.value = value;

  final db = FirebaseFirestore.instance;

  final postList = List<PostData>.empty(growable: true).obs;
  final userPostList = List<PostData>.empty(growable: true).obs;

  @override
  onInit() {
    super.onInit();
    getUserAvatarUrl();
    getPostsFromFirebase();
    getUserOwnedPosts();
  }

  getUserAvatarUrl() async {
    final prof = await UserStore.to.getProfile();
    final avatar = jsonDecode(prof)['avatarUrl'];
    avatarUrl(avatar);
    update();
  }

  setUserAvatarUrl(value) {
    avatarUrl(value);
    update();
  }

  Future<void> getPostsFromFirebase() async {
    var postBase = await db
        .collection('posts')
        .withConverter(
            fromFirestore: PostData.fromFirestore,
            toFirestore: (PostData postData, options) => postData.toFirestore())
        .get();

    for (var doc in postBase.docs) {
      postList.add(doc.data());
    }

    update();
  }

  getUserOwnedPosts() async {
    String profile = await UserStore.to.getProfile();
    UserLoginResponseEntity userdata =
        UserLoginResponseEntity.fromJson(jsonDecode(profile));

    for (var post in postList) {
      if (post.user_id == userdata.accessToken) {
        userPostList.add(post);
      }
    }

    update();
  }
}
