

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raft_test/res/App_text_styles.dart';
import 'package:raft_test/res/app_images.dart';
import 'package:raft_test/res/constants.dart';
import 'package:raft_test/utilities%20/extensions/text_style_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilities /extensions/app_strings.dart';
import '../../widgets/auth_widgets/signin_with_google.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  late double screenHeight;
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: const Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SigninWithGoogle()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
