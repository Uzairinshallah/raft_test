import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raft_test/provider/auth_provider.dart';
import 'package:raft_test/provider/user_provider.dart';
import 'package:raft_test/res/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../provider/post_provider.dart';
import '../../res/app_images.dart';
import '../../res/constants.dart';
import '../../res/functions.dart';
import '../../utilities /extensions/app_strings.dart';
import '../custom_widgets/custom_text.dart';
import 'package:provider/provider.dart';


class SigninWithGoogle extends StatefulWidget {
  const SigninWithGoogle({
    super.key,
    this.space,
  });
  final double? space;

  @override
  State<SigninWithGoogle> createState() => _SigninWithGoogleState();
}

class _SigninWithGoogleState extends State<SigninWithGoogle> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authPro = Provider.of<AuthProvider>(context);
    UserProvider userPro = Provider.of<UserProvider>(context);
    return InkWell(
      onTap: () async {
        Functions.googleSignUp(context);

        // await authPro.convertGoogleSignInUser(
        //     context, userPro);
        // Navigator.of(context).pop();
      },
      child: Container(
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primary.withOpacity(.6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                height: 30,
                child: Image.asset(AppImages.googleIcon),
              ),
              SizedBox(
                width: (widget.space == null)
                    ? screenWidth(context) * 0.1
                    : widget.space!,
              ),
              CustomText(
                text: '${AppStrings.signInWith} Google',
                textStyle: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
