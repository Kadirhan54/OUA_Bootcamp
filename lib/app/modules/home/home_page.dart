import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/entities/post.dart';
import 'package:oua_bootcamp/app/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget buildListItem(PostData item) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          if (item.id != null) {
            HomeController.instance.goPostPageWithPostData(item);
          }
        },
        child: ListTile(
          title: Text(item.title.toString()),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.network(item.owner_avatarUrl.toString()),
          ),
          trailing: Text(item.like_count.toString()),
          subtitle: Text(item.body.toString()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.topLeft,
                  colors: [Colors.purple, Colors.red],
                  begin: Alignment.bottomRight),
            ),
          ),
          toolbarHeight: 10,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Today'),
              Tab(text: 'Popular'),
              Tab(text: 'Follow'),
            ],
          ),
        ),
        body: GetBuilder<HomeController>(
          // init: HomeController(),
          builder: (controller) {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        PostData item = controller.postList[index];
                        return buildListItem(item);
                      }, childCount: controller.postList.length),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
