import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/home/controller/home_controller.dart';
import 'package:oua_bootcamp/app/modules/home/views/post_view/post_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() =>
            Text('${HomeController.instance.liste.length} Adet Veri Var')),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.amber,
          ),
          GetBuilder<HomeController>(
            // init: HomeController(),
            builder: (controller) {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: HomeController.instance.liste.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.liste[index]['title']),
                        leading:
                            Text("User :${controller.liste[index]['userId']}"),
                        trailing: const Icon(CupertinoIcons.person),
                        subtitle: Text(controller.liste[index]['body']),
                        onTap: () => Get.to(() => const PostView()),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
