import 'package:flutter/material.dart';
import 'package:transactions/resource/app_colors.dart';
import 'package:transactions/resource/app_images.dart';
import 'package:transactions/resource/component/content.dart';
import 'package:transactions/utils/sizeconfig.dart';
import 'package:transactions/view/transaction_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizedConfig sizedConfig = SizedConfig(context);
    return Scaffold(
      backgroundColor: AppColors.thirdColor,
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Content(
                  data: "Neural Bank",
                  size: sizedConfig.height(0.04),
                  color: AppColors.primaryColor,
                  weight: FontWeight.bold,
                  alignment: TextAlign.center,
                ),
                Content(
                  data: "The Way you come first",
                  size: sizedConfig.height(0.02),
                  color: AppColors.primaryColor,
                ),
                Image.asset(
                  AppImages.logo,
                  height: sizedConfig.height(0.24),
                  // width: sizedConfig.width(0.2),
                  color: AppColors.secondaryColor, fit: BoxFit.cover,
                ),
                // SizedBox(height: sizedConfig.height(0.1),)
              ],
            ),
          ),
          Positioned(
              bottom: 30,
              right: 30,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionView()));
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: sizedConfig.height(0.05),
                    color: AppColors.primaryColor,
                  )))
        ],
      )),
    );
  }
}
