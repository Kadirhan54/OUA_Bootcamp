import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/home/home_controller.dart';

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
          const SizedBox(
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'kadosama',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('caylak', style: TextStyle(color: Colors.green)),
                  SizedBox(
                    height: 30,
                  ),
                  Text('15 Entry  -  2 Follower  -  1 Following'),
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
