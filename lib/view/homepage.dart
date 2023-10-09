import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raft_test/provider/post_provider.dart';
import 'package:raft_test/res/App_text_styles.dart';
import 'package:raft_test/utilities%20/extensions/text_style_extension.dart';
import 'package:raft_test/view/auth/login_screen.dart';
import 'package:raft_test/widgets/custom_widgets/custom_text.dart';
import '../res/app_colors.dart';
import '../res/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Homepage extends StatelessWidget {
  Homepage({super.key});

  var caption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PostProvider postPro = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,

        title: CustomText(
            text: "Homepage",
            textStyle:
            AppTextStyles.inter.copyWith(color: Colors.white).s22.w7),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding),
          child: Column(
            children: [
              getSpace(
                h: getTopSpace(context),
              ),
              InkWell(onTap: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
              }, child: Text("logout",))

            ],
          ),
        ),
      ),

    );
  }
}
