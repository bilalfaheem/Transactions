import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transactions/resource/app_colors.dart';
import 'package:transactions/resource/component/content.dart';
import 'package:transactions/resource/component/myappbar.dart';
import 'package:transactions/resource/component/transaction_tile.dart';
import 'package:transactions/utils/sizeconfig.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    SizedConfig sizedConfig = SizedConfig(context);
    return Scaffold(
      appBar: MyAppBar(
        title: "Neural Bank",
        backButton: false,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            vertical: sizedConfig.height(0.02),
            horizontal: sizedConfig.height(0.02)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Content(
              data: "Transactions:",
              size: sizedConfig.height(0.024),
              weight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              height: sizedConfig.height(0.01),
            ),
            TransactionTile(),
            TransactionTile()
          ],
        ),
      ),
    );
  }
}
