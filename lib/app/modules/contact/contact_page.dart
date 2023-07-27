import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oua_bootcamp/app/common/entities/entities.dart';
import 'package:oua_bootcamp/app/modules/contact/contact_controller.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  Widget buildListItem(UserData item) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          if (item.id != null) {
            ContactController.to.goChatWithUserData(item);
          }
        },
        child: ListTile(
          title: Text(
            item.name.toString(),
            style: GoogleFonts.roboto(
              fontSize: 15,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: SizedBox(
              width: 54,
              height: 54,
              child: Image.network('${item.avatarUrl}'),
            ),
          ),
          trailing: const Text('12.43'),
          subtitle: const Text('last message'),
        ),
      ),
    );
  }

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
      body: GetBuilder<ContactController>(
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    UserData item = controller.contactList[index];
                    return buildListItem(item);
                  }, childCount: controller.contactList.length),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


/////////////////////////////////////// FAKE

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Messages'),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: Icon(Icons.search),
//           )
//         ],
//         // backgroundColor: Colors.transparent,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 end: Alignment.topLeft,
//                 colors: [Colors.purple, Colors.red],
//                 begin: Alignment.bottomRight),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           ListTile(
//             title: const Text('Kadirhan Sağlam'),
//             leading:
//                 // Text("User :${controller.liste[index]['userId']}"),
//                 CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Image.network(
//                   'https://api.dicebear.com/6.x/adventurer/png?seed=${Random().nextInt(500)}'),
//             ),
//             trailing: Text('${Random().nextInt(24)}:${Random().nextInt(59)}'),
//             subtitle: const Text('Try to set overflow property'),
//           ),
//           const Divider(thickness: 1),
//           ListTile(
//             title: const Text('Selin Berçin'),
//             leading:
//                 // Text("User :${controller.liste[index]['userId']}"),
//                 CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Image.network(
//                   'https://api.dicebear.com/6.x/adventurer/png?seed=${Random().nextInt(500)}'),
//             ),
//             trailing: Text('${Random().nextInt(24)}:${Random().nextInt(59)}'),
//             subtitle: const Text('Adding more to the above-selected answer'),
//           ),
//           const Divider(thickness: 1),
//           ListTile(
//             title: const Text('Nilsu Sevinçli'),
//             leading:
//                 // Text("User :${controller.liste[index]['userId']}"),
//                 CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Image.network(
//                   'https://api.dicebear.com/6.x/adventurer/png?seed=${Random().nextInt(500)}'),
//             ),
//             trailing: Text('${Random().nextInt(24)}:${Random().nextInt(59)}'),
//             subtitle: const Text('There"s no need of using RichText'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//////////////////////////////////////////////////////
///

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

      
