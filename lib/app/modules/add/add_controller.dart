import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/entities/post.dart';
import 'package:oua_bootcamp/app/common/entities/user.dart';
import 'package:oua_bootcamp/app/common/store/user.dart';
import 'package:oua_bootcamp/app/modules/home/home_controller.dart';
import 'package:oua_bootcamp/app/modules/profile/profile_controller.dart';

class AddController extends GetxController {
  static final instance = Get.find<AddController>();

  final db = FirebaseFirestore.instance;

  final titleTextEditingController = TextEditingController();
  final bodyTextEditingController = TextEditingController();

  submitPost() async {
    UserLoginResponseEntity profile =
        await UserStore.to.getProfileUserLoginResponseEntity();

    final data = PostData(
        add_time: Timestamp.now(),
        body: bodyTextEditingController.text,
        title: titleTextEditingController.text,
        user_id: profile.accessToken,
        like_count: 0,
        owner_avatarUrl: profile.avatarUrl,
        id: '0');

    await db
        .collection("posts")
        .withConverter(
          fromFirestore: PostData.fromFirestore,
          toFirestore: (PostData postData, options) => postData.toFirestore(),
        )
        .add(data);

    titleTextEditingController.text = '';
    bodyTextEditingController.text = '';

    HomeController.instance.getPostsFromFirebase();
    ProfileController.instance.getUserOwnedPosts();

    update();
  }
}
