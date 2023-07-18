import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/entities/post.dart';
import 'package:oua_bootcamp/app/common/entities/user.dart';
import 'package:oua_bootcamp/app/common/store/user.dart';
import 'package:oua_bootcamp/app/modules/home/home_controller.dart';

class AddController extends GetxController {
  static final instance = Get.find<AddController>();

  final db = FirebaseFirestore.instance;

  final titleTextEditingController = TextEditingController();
  final bodyTextEditingController = TextEditingController();

  submitPost() async {
    String profile = await UserStore.to.getProfile();

    UserLoginResponseEntity userdata =
        UserLoginResponseEntity.fromJson(jsonDecode(profile));

    final data = PostData(
        add_time: Timestamp.now(),
        body: bodyTextEditingController.text,
        title: titleTextEditingController.text,
        user_id: userdata.accessToken,
        like_count: 0,
        owner_avatarUrl: userdata.avatarUrl,
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

    update();
  }
}
