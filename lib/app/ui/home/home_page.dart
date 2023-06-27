import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => Get.toNamed('/details'),
//           icon: const Icon(Icons.ac_unit),
//         ),
//         title: Obx(() =>
//             Text('${HomeController.instance.liste.length} Adet Veri Var')),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 100,
//             color: Colors.amber,
//           ),
//           GetBuilder<HomeController>(
//             // init: HomeController(),
//             builder: (controller) {
//               if (controller.isLoading.value) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: HomeController.instance.liste.length,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(controller.liste[index]['title']),
//                         leading: const Icon(Icons.abc),
//                       );
//                     },
//                   ),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
