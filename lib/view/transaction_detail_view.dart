import 'package:flutter/material.dart';
import 'package:transactions/resource/app_images.dart';
import 'package:transactions/resource/component/content.dart';
import 'package:transactions/resource/component/myappbar.dart';
import 'package:transactions/utils/sizeconfig.dart';
import 'package:transactions/utils/utils.dart';

import '../resource/app_colors.dart';

class TransactionDetailView extends StatelessWidget {
  final String amount;
  final String currency;
  final String type;
  final String date;
  final String description;
  const TransactionDetailView(
      {super.key,
      required this.amount,
      required this.currency,
      required this.type,
      required this.date,
      required this.description});

  @override
  Widget build(BuildContext context) {
    SizedConfig sizedConfig = SizedConfig(context);
    return Scaffold(
      appBar: MyAppBar(title: "Neural Bank", backButton: true),
      body: Container(
        margin: EdgeInsets.all(sizedConfig.height(0.02)),
        // width: sizedConfig.screenWidth,
         padding: EdgeInsets.symmetric(horizontal:sizedConfig.height(0.02),vertical: sizedConfig.height(0.04)),
        decoration: BoxDecoration(
            color: AppColors.bg, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                type == "payment"
                    ? AppImages.payment
                    : type == "withdrawal"
                        ? AppImages.deposit
                        : type == "invoice"
                            ? AppImages.invoice
                            : type == "deposit"
                                ? AppImages.deposit
                                : AppImages.logo,
                color: AppColors.secondaryColor,
                height: sizedConfig.height(0.04),
              ),
                Content(
                  data: "   Transaction Detail",
                  size: sizedConfig.height(0.025),
                  color: AppColors.primaryColor,
                  weight: FontWeight.w700,
                ),
              ],
            ),
            SizedBox(height: sizedConfig.height(0.04),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: sizedConfig.height(0.02),),

                    Content(
                      data: "Type: ",
                      size: sizedConfig.height(0.019),
                      color: AppColors.primaryColor,
                      weight: FontWeight.w500,
                    ),
            SizedBox(height: sizedConfig.height(0.02),),

                    Content(
                      data: "Date: ",
                      size: sizedConfig.height(0.019),
                      color: AppColors.primaryColor,
                      weight: FontWeight.w500,
                    ),
            SizedBox(height: sizedConfig.height(0.02),),

                    Content(
                      data: "Description: ",
                      size: sizedConfig.height(0.019),
                      color: AppColors.primaryColor,
                      weight: FontWeight.w500,
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Content(
                            data: amount,
                            size: sizedConfig.height(0.02),
                            color: AppColors.primaryColor,
                            weight: FontWeight.w600,
                          ),
                          Content(
                            data: " $currency",
                            size: sizedConfig.height(0.017),
                            color: AppColors.primaryColor,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                            SizedBox(height: sizedConfig.height(0.02),),
                
                      Content(
                        data: type,
                        size: sizedConfig.height(0.019),
                        color: AppColors.primaryColor,
                        weight: FontWeight.w600,
                      ),
                            SizedBox(height: sizedConfig.height(0.02),),
                
                      Content(
                        data: Utils().dateFormatter(date),
                        size: sizedConfig.height(0.019),
                        color: AppColors.primaryColor,
                        weight: FontWeight.w600,
                      ),
                            SizedBox(height: sizedConfig.height(0.02),),
                
                      Content(
                        data: description,
                        size: sizedConfig.height(0.019),
                        color: AppColors.primaryColor,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(height: sizedConfig.height(0.04),),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
