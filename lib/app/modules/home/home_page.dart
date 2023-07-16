import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/home/home_controller.dart';
import 'package:oua_bootcamp/app/modules/home/post_view.dart';

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
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: HomeController.instance.liste.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.liste[index]['title']),
                          leading:
                              // Text("User :${controller.liste[index]['userId']}"),
                              CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.network(
                                'https://api.dicebear.com/6.x/adventurer/png?seed=${Random().nextInt(500)}'),
                          ),
                          trailing:
                              // const Icon(CupertinoIcons.person),
                              Text(Random().nextInt(100).toString()),
                          subtitle: Text(controller.liste[index]['body']),
                          onTap: () => Get.to(() => const PostView()),
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
