import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oua_bootcamp/app/modules/sign_in/sing_in_controller.dart';

class SigInPage extends GetView<SigInController> {
  const SigInPage({Key? key}) : super(key: key);

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Log In',
        style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.grey[600],
      elevation: 0.3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => controller.handleSignIn(),
                child: Image.asset(
                  'lib/images/google_colored.png',
                  height: 30,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Image.asset(
                'lib/images/facebook.png',
                height: 30,
              ),
              const SizedBox(
                width: 30,
              ),
              Image.asset(
                'lib/images/flutter.png',
                height: 30,
              )
            ],
          ),
          const SizedBox(
            height: 75,
          ),
          Text(
            'or',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400, color: Colors.grey[700]),
          ),
          const SizedBox(
            height: 75,
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                icon: const Icon(Icons.email),
                hintText: 'Enter an email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter password',
                icon: const Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: null,
            child: Text(
              'Forgot Password?',
              style: GoogleFonts.roboto(decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          InkWell(
            onTap: null,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    // offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.indigo[700],
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              width: 350,
              height: 40,
              child: Center(
                child: Text(
                  'Log In',
                  style: GoogleFonts.roboto(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: null,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    // offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              width: 350,
              height: 40,
              child: Center(
                child: Text(
                  'Sing up',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

///////////////////////////// BOOTCAMP SONU ICIN HAZIRLANAN VER
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       color: Colors.white,
  //       child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             const CircleAvatar(
  //               radius: 120,
  //               backgroundImage: AssetImage(
  //                 'lib/images/zenit.png',
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 50,
  //             ),
  //             OutlinedButton.icon(
  //               icon: Image.asset('lib/images/google_colored.png', height: 20),
  //               onPressed: () => controller.handleSignIn(),
  //               label: const Text(
  //                 'Sign-in with Google',
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

////////////////////// BUNUN NE OLDUGU HAKKINDA BIR FIKRIM YOK
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
