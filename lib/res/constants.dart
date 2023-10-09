
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static const double padding = 20;
  static const double appBarSpace = 40;
  static const double appBarBottomSpace = 30;
  static const double verticalPadding = 24;
  static const double horizontalPadding = 16;
  static const double avatarRadius = 45;
  static const double circularRadius = 12;
  static const double circularRadius2 = 22;



}



ThemeData getSplash(BuildContext context) => Theme.of(context).copyWith(
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
);

double getTopSpace(BuildContext context) =>
    (MediaQuery.of(context).size.height * .07);

double screenWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

Widget getSpace({double h = 0, double w = 0}) => SizedBox(
  height: h,
  width: w,
);

