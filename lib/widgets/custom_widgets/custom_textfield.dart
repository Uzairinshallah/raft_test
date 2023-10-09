import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raft_test/utilities%20/extensions/text_style_extension.dart';

import '../../res/App_text_styles.dart';
import '../../res/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  bool obsText = false;



  CustomTextField(
      {Key? key,
        required this.hint,
        required this.controller,
        this.obsText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      margin: EdgeInsets.symmetric(horizontal: 37.w),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        obscureText: obsText,
        controller: controller,
        style: AppTextStyles.inter.copyWith(color : Colors.black).s16,
        decoration: InputDecoration(
          hintText: hint,
          isDense: true,
          hintStyle: AppTextStyles.inter.copyWith(color : Colors.blueGrey).s14,
          contentPadding: EdgeInsets.only(left: 14.w, top: 16.h, bottom: 16.h),
          // fillColor: CColors.textFieldFill,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondary, width: 1.0),
            borderRadius: BorderRadius.circular(7.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.0),
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
      ),
    );
  }
}
