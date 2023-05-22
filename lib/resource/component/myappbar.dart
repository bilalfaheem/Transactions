import 'package:flutter/material.dart';
import 'package:transactions/resource/app_colors.dart';
import 'package:transactions/resource/app_images.dart';

import 'content.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  MyAppBar({required this.title, required this.backButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.thirdColor,
        leading: backButton
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryColor,
                ))
            : null,
        title: Column(
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    // padding: EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset(
                  AppImages.logo,
                  color: AppColors.secondaryColor,
                  height: 35,
                )),
                SizedBox(
                  width: 13,
                ),
                Content(
                  data: title,
                  size: 25,
                  weight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            // Content(
            //   data: "Endurance, Fortitude, Ambition",
            //   size: 15,
            //   color: AppColors.secondaryColor,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
