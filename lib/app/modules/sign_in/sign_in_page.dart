import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/sign_in/sing_in_controller.dart';

class SigInPage extends GetView<SigInController> {
  const SigInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage(
                  'lib/images/zenit.png',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton.icon(
                icon: Image.asset('lib/images/google_colored.png', height: 20),
                onPressed: () => controller.handleSignIn(),
                label: const Text(
                  'Sign-in with Google',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       backgroundColor: Colors.white,
  //       body: Column(
  //         children: [
  //           SizedBox(
  //             width: double.infinity,
  //             height: MediaQuery.of(context).size.height / 3,
  //             child: Image.asset('lib/images/flutter.png'),
  //           ),
  //           Expanded(
  //             child: Container(
  //               width: double.infinity,
  //               decoration: const BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(30),
  //                   topRight: Radius.circular(30),
  //                 ),
  //               ),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(20.0),
  //                 child: SingleChildScrollView(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const Text(
  //                         'Email',
  //                         style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       const SizedBox(height: 10),
  //                       Container(
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(12),
  //                           color: Colors.black,
  //                         ),
  //                         child: const TextField(
  //                           style: TextStyle(color: Colors.white),
  //                           decoration: InputDecoration(
  //                             border: InputBorder.none,
  //                             prefixIcon: Icon(
  //                               Icons.email,
  //                               color: Colors.white,
  //                             ),
  //                             hintText: 'Email',
  //                             hintStyle: TextStyle(color: Colors.white),
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(height: 15),
  //                       const Text(
  //                         'Password',
  //                         style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       const SizedBox(height: 15),
  //                       Container(
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(12),
  //                           color: Colors.black,
  //                         ),
  //                         child: const TextField(
  //                           style: TextStyle(color: Colors.white),
  //                           decoration: InputDecoration(
  //                             border: InputBorder.none,
  //                             prefixIcon: Icon(
  //                               Icons.lock,
  //                               color: Colors.white,
  //                             ),
  //                             hintText: 'Password',
  //                             hintStyle: TextStyle(color: Colors.white),
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(height: 35),
  //                       GestureDetector(
  //                         onTap: () {},
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(30),
  //                             color: Colors.black,
  //                           ),
  //                           child: const Center(
  //                             child: Padding(
  //                               padding: EdgeInsets.all(10.0),
  //                               child: Text(
  //                                 ' Log In',
  //                                 style: TextStyle(
  //                                   color: Colors.white,
  //                                   fontSize: 30,
  //                                   fontWeight: FontWeight.w500,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(height: 35),
  //                       const Center(
  //                         child: Text(
  //                           '- Or Sign In with -',
  //                           style: TextStyle(
  //                             color: Colors.black,
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(height: 20),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           GestureDetector(
  //                             onTap: () {},
  //                             child: Container(
  //                               width: 60,
  //                               height: 60,
  //                               padding: const EdgeInsets.all(5),
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(15),
  //                                 color: Colors.white38,
  //                               ),
  //                               child: Image.asset('lib/images/google.png'),
  //                             ),
  //                           ),
  //                           const SizedBox(width: 50),
  //                           GestureDetector(
  //                             onTap: () {},
  //                             child: Container(
  //                               width: 60,
  //                               height: 60,
  //                               padding: const EdgeInsets.all(5),
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(15),
  //                                 color: Colors.white38,
  //                               ),
  //                               child: Image.asset('lib/images/facebook.png'),
  //                             ),
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
