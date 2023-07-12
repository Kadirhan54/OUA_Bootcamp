import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/home/post_view_controller.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.back)),
        title: const Text('Post View'),
      ),
      body: GetBuilder<PostViewController>(builder: (controller) {
        return Text(controller.post.toString());
      }),
    );
  }
}
