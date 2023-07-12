import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/home/home_controller.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(CupertinoIcons.chat_bubble_2_fill),
      ),
      appBar: AppBar(
        title: const Text('Messages'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.search),
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
      body: GetBuilder<HomeController>(builder: (controller) {
        return Column(
          children: [
            ListTile(
              title: const Text('Kadirhan Sağlam'),
              leading:
                  // Text("User :${controller.liste[index]['userId']}"),
                  const CircleAvatar(backgroundColor: Colors.blue),
              trailing: Text('${Random().nextInt(24)}:${Random().nextInt(59)}'),
              subtitle: const Text('Try to set overflow property'),
            ),
            const Divider(thickness: 1),
            ListTile(
              title: const Text('Selin Berçin'),
              leading:
                  // Text("User :${controller.liste[index]['userId']}"),
                  const CircleAvatar(backgroundColor: Colors.purple),
              trailing: Text('${Random().nextInt(24)}:${Random().nextInt(59)}'),
              subtitle: const Text('Adding more to the above-selected answer'),
            ),
            const Divider(thickness: 1),
            ListTile(
              title: const Text('Nilsu Sevinçli'),
              leading:
                  // Text("User :${controller.liste[index]['userId']}"),
                  const CircleAvatar(backgroundColor: Colors.green),
              trailing: Text('${Random().nextInt(24)}:${Random().nextInt(59)}'),
              subtitle: const Text('There"s no need of using RichText'),
            ),
          ],
        );
      }),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: 3,
      //         shrinkWrap: true,
      //         itemBuilder: (context, index) {
      //           return GetBuilder<HomeController>(builder: (controller) {
      //             return ListTile(
      //               title: Text('asdasd'),
      //               leading:
      //                   // Text("User :${controller.liste[index]['userId']}"),
      //                   const CircleAvatar(backgroundColor: Colors.green),
      //               trailing:
      //                   Text('${Random().nextInt(24)}:${Random().nextInt(59)}'),
      //               subtitle: Text(controller.liste[index]['body']),
      //             );
      //           });
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
