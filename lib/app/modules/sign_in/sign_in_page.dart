import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oua_bootcamp/app/modules/sign_in/sing_in_controller.dart';

class SigInPage extends GetView<SigInController> {
  const SigInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () => controller.handleSignIn(), child: const Text('Bas')),
      ),
    );
  }
}
