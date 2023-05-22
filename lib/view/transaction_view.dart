import 'package:flutter/material.dart';
import 'package:transactions/repository/transaction_repository.dart';
import 'package:transactions/resource/app_colors.dart';
import 'package:transactions/resource/component/content.dart';
import 'package:transactions/resource/component/myappbar.dart';
import 'package:transactions/resource/component/transaction_tile.dart';
import 'package:transactions/utils/sizeconfig.dart';


class TransactionView extends StatelessWidget {
  TransactionView({super.key});

  final transactionRepo = TransactionRepository();

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
            FutureBuilder(
                future: transactionRepo.fetchTransactionList(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Content(data: "Error ${snapshot.error}", size: 12),
                    );
                  } else if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: transactionList.length,
                          itemBuilder: (context, index) {
                            final iteration = transactionList[index];
                            return TransactionTile(
                              amount: iteration.amount.toString(),
                              currency: iteration.currency.toString(),
                              type: iteration.type.toString(),
                              date: iteration.date.toString(),
                              description: iteration.description.toString(),
                            );
                          }),
                    );
                  } else {
                    return Content(data: "No Data", size: 12);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
