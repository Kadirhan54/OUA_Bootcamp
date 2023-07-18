import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/avatar/avatar_controller.dart';

class AvatarPage extends GetView<AvatarController> {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar'),
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
      body: GetBuilder<AvatarController>(builder: (controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 120,
                backgroundImage: NetworkImage(
                  controller.avatarUrl.toString(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton(
                onPressed: () => controller.newAvatar(),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.blue.withOpacity(0.9)),
                ),
                child: const Text(
                  'Regenerate',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  Get.snackbar(
                      'Success', 'You Have Successfully Assigned an Avatar!');
                  Get.off(const AvatarPage());
                  controller.submitAvatar();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.green.withOpacity(0.9)),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
