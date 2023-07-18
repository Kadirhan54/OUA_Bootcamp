import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/discover/discover_controller.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'), centerTitle: true,
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
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey.shade300],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: const Column(
              children: [
                // TextFormField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(50),
                //     ),
                //     labelText: 'Title, #entry or @writer',
                //   ),
                // ),
                ListTile(
                  leading: Text('Topic'),
                  trailing: Text('Entry number'),
                ),
              ],
            ),
          ),
          GetBuilder<DiscoverController>(
            builder: (controller) {
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.grey.shade200],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: ListView.separated(
                    itemCount: controller.topics.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.topics[index]),
                        trailing: Text(Random().nextInt(500).toString()),
                        // titleAlignment: ListTileTitleAlignment.top,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
