import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/add/add_controller.dart';
import 'package:oua_bootcamp/app/modules/dashboard/dashboard_controller.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Entry'), centerTitle: true,
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
      body: GetBuilder<AddController>(
        builder: (controller) {
          return Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: controller.titleTextEditingController,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.blue),
                        labelText: 'Title',
                        hintText: "Enter title"),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: controller.bodyTextEditingController,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.blue),
                        labelText: 'Content',
                        hintText: "Enter content"),
                    maxLines: 10,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                  onPressed: () {
                    controller.submitPost();
                    Get.snackbar(
                        'Success', 'You had Successfully Created Post!');
                    DashboardController.instance.changeTabIndex(0);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.green.withOpacity(0.9)),
                  ),
                  child: const Text(
                    'Submit New Post',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
