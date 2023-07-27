// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oua_bootcamp/app/common/entities/user.dart';
import 'package:oua_bootcamp/app/common/store/user.dart';
import 'package:oua_bootcamp/app/routes/app_pages.dart';

class SigInController extends GetxController {
  static SigInController instance = Get.find();

  final db = FirebaseFirestore.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['openid'],
  );

  get googleSignIn => _googleSignIn;

  Future<void> handleSignIn() async {
    try {
      var googleAccount = await _googleSignIn.signIn();

      if (googleAccount != null) {
        final _gAuthentication = await googleAccount.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken);

        await FirebaseAuth.instance.signInWithCredential(_credential);

        var user = await db
            .collection("users")
            .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userdata, options) =>
                  userdata.toFirestore(),
            )
            .where("id", isEqualTo: googleAccount.id)
            .get();

        // if user not exists in firebase, create new.
        if (user.docs.isEmpty) {
          final data = UserData(
              id: googleAccount.id,
              name: googleAccount.displayName ?? googleAccount.email,
              email: googleAccount.email,
              avatarUrl: user.docs.single.data().avatarUrl,
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

        UserLoginResponseEntity userProfile = UserLoginResponseEntity();

        userProfile.email = googleAccount.email;
        userProfile.accessToken = googleAccount.id;
        userProfile.displayName =
            googleAccount.displayName ?? googleAccount.email;
        userProfile.avatarUrl = user.docs.single.data().avatarUrl;

        UserStore.to.saveProfile(userProfile);

        Get.offAndToNamed(Routes.MAIN);
        Get.snackbar('Success', 'You have successfully logged in!');
      }
    } catch (e) {
      Get.snackbar('Error', 'There is no Google Account!');

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
