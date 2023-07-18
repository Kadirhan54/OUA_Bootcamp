import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/avatar/avatar_page.dart';
import 'package:oua_bootcamp/app/modules/home/home_controller.dart';
import 'package:oua_bootcamp/app/modules/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.settings),
          )
        ],
        // backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.topLeft,
                colors: [Colors.purple, Colors.red],
                begin: Alignment.bottomRight),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'kadosama',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('caylak', style: TextStyle(color: Colors.green)),
                      SizedBox(
                        height: 75,
                      ),
                      Text('15 Entry  -  2 Follower  -  1 Following'),
                    ],
                  ),
                  GetBuilder<ProfileController>(builder: (controller) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Image.network(
                          controller.avatarUrl.value ?? '',
                          height: 100,
                        ),
                        SizedBox(
                          height: 25,
                          width: 90,
                          child: OutlinedButton(
                            onPressed: () {
                              Get.to(() => const AvatarPage());
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.blueGrey.withOpacity(0.9)),
                            ),
                            child: const Text(
                              'Change',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          DefaultTabController(
            length: 3,
            child: Container(
              color: Colors.grey.shade400,
              child: const TabBar(
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.purple,
                labelStyle: TextStyle(color: Colors.pink, fontSize: 18),
                tabs: [
                  Tab(text: "entry's"),
                  Tab(text: 'favorites'),
                  Tab(text: 'statistics'),
                ],
              ),
            ),
          ),
          GetBuilder<HomeController>(builder: (controller) {
            return Expanded(
              child: ListView.separated(
                itemCount: HomeController.instance.liste.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.liste[index]['title']),
                    trailing:
                        // const Icon(CupertinoIcons.person),
                        Text(Random().nextInt(100).toString()),
                    subtitle: Text(controller.liste[index]['body']),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
