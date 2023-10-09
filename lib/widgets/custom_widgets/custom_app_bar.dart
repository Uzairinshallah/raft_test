import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raft_test/res/app_images.dart';

import '../../res/constants.dart';
import 'custom_asset_image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.scaffoldKey, super.key, });
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAssetImage(
          image: AppImages.logo, // AppImages.klikyLogo2,
          h: 26,
          w: 85,
          radius: 0,
        ),
        Row(
          children: [
            CustomAssetImage(
                image: AppImages.googleIcon,
                col: Theme.of(context).splashColor,
                h: 21,
                w: 18,
                radius: 0,
                onTap: () {
                }),
            getSpace(w: 10),
            IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).splashColor,
                size: 24,
              ),
            ),
          ],
        )
      ],
    );
  }
}