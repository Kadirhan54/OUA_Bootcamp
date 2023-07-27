import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/common/entities/entities.dart';
import 'package:oua_bootcamp/app/modules/avatar/avatar_page.dart';
import 'package:oua_bootcamp/app/modules/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListItem(PostData item) {
      return Container(
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: () {
            if (item.id != null) {
              // ProfileController.instance.goChatWithUserData(item);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title.toString(),
              )
            ],
          ),
        ),
      );
    }

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
                  Column(
                    children: [
                      Image.network(
                        ProfileController.instance.avatarUrl.value ?? '',
                        height: 100,
                      ),
                      OutlinedButton(
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
                      SizedBox(
                        height: 25,
                        width: 90,
                        child: OutlinedButton(
                          onPressed: () {
                            ProfileController.instance.handleLogOut();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.red.withOpacity(0.9)),
                          ),
                          child: const Text(
                            'Log Out',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
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
          GetBuilder<ProfileController>(builder: (controller) {
            if (controller.isLoading.value == false) {
              return Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          PostData item = controller.userOwnedPostsList[index];
                          return buildListItem(item);
                        }, childCount: controller.userOwnedPostsList.length),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
        ],
      ),
    );
  }
}
