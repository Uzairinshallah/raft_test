import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raft_test/provider/post_provider.dart';
import 'package:raft_test/res/App_text_styles.dart';
import 'package:raft_test/utilities%20/extensions/text_style_extension.dart';
import 'package:raft_test/widgets/custom_widgets/custom_button.dart';
import 'package:raft_test/widgets/custom_widgets/custom_text.dart';
import '../res/app_colors.dart';
import '../res/constants.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_widgets/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AddPost extends StatefulWidget {
  AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  var caption = TextEditingController();


  @override
  Widget build(BuildContext context) {
    PostProvider postPro = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,

        title: CustomText(
            text: "Add Post",
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
              InkWell(
                onTap: (){
                  postPro.pickProfilePhoto();
                },
                child: postPro.profilePhoto == null
                    ? CustomText(text: "Pick Image", textStyle: AppTextStyles.inter.s22.w7,)
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(postPro.profilePhoto!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 200, // Set the width and height as needed
                    height: 200,
                  ),
                ),
              ),

              getSpace(h: 50),

              CustomTextField(
                controller: caption,
                hint: "Add Caption",
              ),
              getSpace(h: 60.h),
              CustomButton(text: "Add Post", onTap: (){})
            ],
          ),
        ),
      ),

    );
  }
}
