import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          bottom: const TabBar(tabs: [
            Tab(text: 'Today'),
            Tab(text: 'Popular'),
            Tab(text: 'Follow'),
          ]),
        ),
        body: Column(
          children: [
            GetBuilder<HomeController>(
              // init: HomeController(),
              builder: (controller) {
                if (HomeController.instance.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: HomeController.instance.postList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(controller.postList[index].title.toString()),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.network(controller
                                .postList[index].owner_avatarUrl
                                .toString()),
                          ),
                          trailing:
                              // const Icon(CupertinoIcons.person),
                              Text(controller.postList[index].like_count
                                  .toString()),
                          subtitle:
                              Text(controller.postList[index].body.toString()),
                          onTap: () => controller.goPostPageWithPostData,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
