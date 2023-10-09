import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raft_test/models/user_model.dart';
import 'package:raft_test/provider/post_provider.dart';
import 'package:raft_test/provider/user_provider.dart';
import 'package:raft_test/res/App_text_styles.dart';
import 'package:raft_test/res/app_images.dart';
import 'package:raft_test/utilities%20/extensions/text_style_extension.dart';
import 'package:raft_test/widgets/custom_widgets/custom_text.dart';
import '../data/app_user/auth_methods.dart';
import '../res/app_colors.dart';
import '../res/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  var caption = TextEditingController();

  List<String> imageUrls = [
    "https://cdn.pixabay.com/photo/2016/03/26/13/09/cup-of-coffee-1280537_1280.jpg",
    "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg",
    "https://cdn.pixabay.com/photo/2015/01/09/11/08/startup-594090_1280.jpg",
    "https://cdn.pixabay.com/photo/2015/01/09/11/08/startup-594090_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/03/26/13/09/cup-of-coffee-1280537_1280.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    UserProvider userPro = Provider.of<UserProvider>(context);
    UserModel userModel = userPro.user(AuthMethods.uid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: CustomText(
            text: "Profile Screen",
            textStyle:
                AppTextStyles.inter.copyWith(color: Colors.white).s22.w7),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 270.h,
                decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(.3),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
              ),
              Positioned(
                top: 40.h,
                left: 20.w,
                right: 20.w,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            AppImages.logo,
                          ),
                        ),
                        getSpace(
                          w: 30,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: userModel.userName ?? "user name"),
                              CustomText(text: userModel.email ?? "dummy@gmail.com"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    getSpace(h: 15.h),
                    Row(
                      children: [
                        getFollowBtn("Following", AppColors.primary, 10),
                        getFollowBtn("Followers", AppColors.primary, 10),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          getSpace(h: 20.h),
          const CustomText(text: "All Posts", bold: FontWeight.w700, size: 22, textAlign: TextAlign.left),
          getSpace(h: 20.h),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ImageGridView(imageUrls),
          )),
        ],
      ),
    );
  }

  Expanded getFollowBtn(String txt, Color col, int count) {
    return Expanded(
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primary.withOpacity(.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: txt,
              color: Colors.white,
              bold: FontWeight.w700,
            ),
            getSpace(w: 10.w),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomText(
                text: count.toString(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageGridView extends StatelessWidget {
  final List<String> imageUrls;

  ImageGridView(this.imageUrls);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: imageUrls.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: imageUrls[index],
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        );
      },
    );
  }
}
