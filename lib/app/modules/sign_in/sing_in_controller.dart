// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oua_bootcamp/app/common/entities/user.dart';
import 'package:oua_bootcamp/app/common/routes/names.dart';
import 'package:oua_bootcamp/app/common/store/user.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>['openid'],
);

class SigInController extends GetxController {
  static SigInController instance = Get.find();

  final db = FirebaseFirestore.instance;

  Future<void> handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();

      if (user != null) {
        final _gAuthentication = await user.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken);

        await FirebaseAuth.instance.signInWithCredential(_credential);

        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String avatarUrl =
            'https://api.dicebear.com/6.x/adventurer/png?seed=${Random().nextInt(500)}';

        UserLoginResponseEntity userProfile = UserLoginResponseEntity();

        userProfile.email = email;
        userProfile.accessToken = id;
        userProfile.displayName = displayName;
        userProfile.avatarUrl = avatarUrl;

        UserStore.to.saveProfile(userProfile);

        var userbase = await db
            .collection("users")
            .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userdata, options) =>
                  userdata.toFirestore(),
            )
            .where("id", isEqualTo: id)
            .get();

        if (userbase.docs.isEmpty) {
          final data = UserData(
              id: id,
              name: displayName,
              email: email,
              avatarUrl: avatarUrl,
              location: '',
              fcmtoken: '',
              addtime: Timestamp.now());

          await db
              .collection("users")
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userdata, options) =>
                    userdata.toFirestore(),
              )
              .add(data);
        }

        Get.offAndToNamed(AppRoutes.INITIAL);
        Get.snackbar('Success', 'You have successfully logged in!');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occured!');

      print(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('user is currently logged out');
      } else {
        print('user is logged in');
      }
    });
  }
}
