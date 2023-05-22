import 'package:flutter/material.dart';
import 'package:transactions/resource/app_colors.dart';
import 'package:transactions/resource/app_images.dart';
import 'package:transactions/resource/component/content.dart';
import 'package:transactions/utils/sizeconfig.dart';
import 'package:transactions/utils/utils.dart';
import 'package:transactions/view/transaction_detail_view.dart';

class TransactionTile extends StatelessWidget {
  final String amount;
  final String currency;
  final String type;
  final String date;
  final String description;
  const TransactionTile(
      {super.key,
      required this.amount,
      required this.currency,
      required this.type,
      required this.date,
      required this.description});

  @override
  Widget build(BuildContext context) {
    SizedConfig sizedConfig = SizedConfig(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TransactionDetailView(amount: amount, currency: currency, type: type, date: date, description: description)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: sizedConfig.height(0.01)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: AppColors.bg,
          leading: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(sizedConfig.height(0.01)),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
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
                  Content(
                    data: type,
                    size: sizedConfig.height(0.019),
                    color: AppColors.primaryColor,
                    weight: FontWeight.w600,
                  ),
                  Content(
                    data: Utils().dateFormatter(date),
                    size: sizedConfig.height(0.019),
                    color: AppColors.primaryColor,
                    weight: FontWeight.w600,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
