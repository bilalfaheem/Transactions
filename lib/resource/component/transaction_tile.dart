import 'package:flutter/material.dart';
import 'package:transactions/resource/app_colors.dart';
import 'package:transactions/resource/app_images.dart';
import 'package:transactions/resource/component/content.dart';
import 'package:transactions/utils/sizeconfig.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key});

  @override
  Widget build(BuildContext context) {
    SizedConfig sizedConfig = SizedConfig(context);
    return Container(
      margin: EdgeInsets.only(bottom: sizedConfig.height(0.01)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        tileColor: Color.fromARGB(52, 208, 185, 201),
        //  Color.fromARGB(25, 243, 129, 97),
        //  Color.fromARGB(64, 219, 211, 216),
        leading: AspectRatio(
          aspectRatio: 1,
          child: Container(
            padding: EdgeInsets.all(sizedConfig.height(0.01)),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              AppImages.deposit,
              color: AppColors.secondaryColor,
              height: sizedConfig.height(0.02),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                  data: "Amount:  ",
                  size: sizedConfig.height(0.019),
                  color: AppColors.primaryColor,
                  weight: FontWeight.w500,
                ),
                Content(
                  data: "Type: ",
                  size: sizedConfig.height(0.019),
                  color: AppColors.primaryColor,
                  weight: FontWeight.w500,
                ),
                Content(
                  data: "Date: ",
                  size: sizedConfig.height(0.019),
                  color: AppColors.primaryColor,
                  weight: FontWeight.w500,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Content(
                      data: "1200",
                      size: sizedConfig.height(0.02),
                      color: AppColors.primaryColor,
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: " INR",
                      size: sizedConfig.height(0.017),
                      color: AppColors.primaryColor,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                Content(
                  data: "Withdrawal",
                  size: sizedConfig.height(0.019),
                  color: AppColors.primaryColor,
                  weight: FontWeight.w600,
                ),
                Content(
                  data: "12-Mar-2022",
                  size: sizedConfig.height(0.019),
                  color: AppColors.primaryColor,
                  weight: FontWeight.w600,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
