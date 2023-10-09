import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../res/constants.dart';

class CustomAssetImage extends StatelessWidget {
  const CustomAssetImage({
    required this.image,
    required this.h,
    required this.w,
    this.onTap,
    this.radius = 12,
    this.boxFit = BoxFit.cover,
    this.col,
    Key? key,
  }) : super(key: key);
  final String image;
  final double radius;
  final BoxFit boxFit;
  final Color? col;
  final double h;
  final double w;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: getSplash(context),
      child: InkWell(
        onTap: () {
          if(onTap != null){
            onTap!();
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image(
            image: AssetImage(image),
            color: (col != null) ? col : null,
            height: h,
            width: w,
            fit: boxFit,
          ),
        ),
      ),
    );
  }
}



