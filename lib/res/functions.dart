import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

import '../view/dashboard.dart';
import 'app_colors.dart';

class Functions{
  static googleSignUp(BuildContext context) async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final user = await googleSignIn.signIn();

    if (user != null) {
      const SizedBox(
          height: 300,
          width: 300,
          child: CircularProgressIndicator(color: Colors.deepOrange,),
      );
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var res = await FirebaseAuth.instance.signInWithCredential(credential);
      final name = user.displayName ?? "";
      final email = user.email;
      final img = user.photoUrl;
      setSocialUser(context, name, email, (img ?? ""));
    }
  }





  static setSocialUser(
      BuildContext context, String name, String email, String img) async {
    final auth = FirebaseAuth.instance;
    final collectionRef = FirebaseFirestore.instance.collection('users');

    UserModel userModel = UserModel(
      uid: auth.currentUser!.uid,
      email: email,
      userName: name,
      img: img,
      followingCount: 0,
      followerCount: 0,
    );
    await collectionRef.doc(auth.currentUser!.uid).set(userModel.toMap());
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false);
  }



  static showSignInDialog(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 50));
    AlertDialog alert = AlertDialog(
      elevation: 0,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent.withOpacity(0),
      content: const SpinKitChasingDots(
        color: AppColors.primary,
        size: 50.0,
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}