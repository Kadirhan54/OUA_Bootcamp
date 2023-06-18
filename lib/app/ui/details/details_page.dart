import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/controller/details/details_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.toNamed('/'),
          icon: const Icon(Icons.access_alarm_outlined),
        ),
        title: const Text("Veri Çek"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onSubmitted: (value) =>
                DetailsController.instance.getPostById(int.parse(value)),
          ),
          Obx(
            () {
              if (DetailsController.instance.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Text(
                  DetailsController.instance.post.firstRebuild
                      ? 'Please enter the number'
                      : DetailsController.instance.post.toString(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
