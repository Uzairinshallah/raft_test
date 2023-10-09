import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raft_test/res/app_colors.dart';
import 'package:raft_test/view/add_post.dart';
import 'package:raft_test/view/profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../res/app_images.dart';
import '../utilities /extensions/app_strings.dart';
import 'homepage.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int index = 0;

  List<Widget> mainWidgets = [
    Homepage(),
    AddPost(),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      body: mainWidgets.elementAt(index),
      bottomNavigationBar: bottomNavBar(),

    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      elevation: 5,
      onTap: (i) {
        if (i > 3) {
          return;
        }
        index = i;
        setState(() {});
      },
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.black,
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 13.sp,
      selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13.sp,
          color: AppColors.primary),
      unselectedFontSize: 13.sp,
      iconSize: 30.w,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.home,
              color: (index == 0) ? AppColors.primary : Colors.black,
              height: 20,
            ),
            label: AppStrings.home,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            AppImages.addPost,
            color: (index == 1) ? AppColors.primary : Colors.black,
            height: 20,
          ),
          label: AppStrings.post,
        ),
        BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.profile,
              color: (index == 2) ? AppColors.primary : Colors.black,
              height: 20,
            ),
            label: AppStrings.profile),
      ],
    );
  }
}
