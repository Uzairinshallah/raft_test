import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:raft_test/res/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dashboard.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              FirebaseAuth.instance.currentUser?.uid == null
                  ? LoginScreen()
                  : Dashboard(),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Image(image: AssetImage(AppImages.logo), height: 140.h, fit: BoxFit.fill),
        ),
      ), //<- place where the image appears
    );
  }
}
