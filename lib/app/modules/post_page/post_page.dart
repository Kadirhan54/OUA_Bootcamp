import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oua_bootcamp/app/modules/post_page/post_page_controller.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostPageController>(
      builder: (controller) {
        return Scaffold(
          appBar: buildAppBar(controller),
          body: Column(
            children: [
              buildPostCardItem(controller),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return buildCommentListItem(controller);
                        }, childCount: 3),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  AppBar buildAppBar(PostPageController controller) {
    return AppBar(
      title: Text(
        controller.postData.title.toString(),
      ),
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 16,
      ),
      titleSpacing: 0,
      leading: IconButton(
          onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.back)),
      // backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.topLeft,
              colors: [Colors.purple, Colors.red],
              begin: Alignment.bottomRight),
        ),
      ),
    );
  }

  Padding buildCommentListItem(PostPageController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        height: 40,
        child: Text(controller.postData.title!),
      ),
    );
  }

  Card buildPostCardItem(PostPageController controller) {
    return Card(
      elevation: 50,
      color: Colors.blueGrey[300],
      child: SizedBox(
        height: 175,
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(controller.postData.owner_avatarUrl!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.postData.user_id!,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const SizedBox(
                    height: 30,
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: null,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                controller.postData.body!,
              ),
            ),
            const Expanded(
              child: SizedBox(width: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.postData.add_time!.toDate().toString(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${controller.postData.like_count}23  likes',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
