import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raft_test/utilities%20/extensions/text_style_extension.dart';

import '../../res/App_text_styles.dart';
import '../../res/app_colors.dart';





class CustomButton extends StatelessWidget {
  String text;
  Function onTap;
  CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 37.w,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.primary,
            padding: EdgeInsets.symmetric(vertical: 15.5.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          onPressed: () {
            onTap();
          },
          child: Text(
            text,
            style: AppTextStyles.inter.copyWith(color: Colors.white).s16.w7,
          ),
        ),
      ),
    );
  }
}
