// import 'package:flutter/material.dart';
// import 'package:transactions/data/response/api_response.dart';
// import 'package:transactions/model/transaction_model/transaction_model.dart';
// import 'package:transactions/repository/transaction_repository.dart';

// class TransactionViewModel with ChangeNotifier {
//   final _myRepo = TransactionRepository();

//   ApiResponse<TransactionModel> transactionList = ApiResponse.loading();

//   setTransactionList(ApiResponse<TransactionModel> response) {
//     transactionList = response;
//     print(transactionList);
//     notifyListeners();
//   }

//   Future<void> fetchTransactionListApi() async {
//     setTransactionList(ApiResponse.loading());
//     _myRepo.fetchTransactionList().then((value) {
//       setTransactionList(ApiResponse.completed(value));
//     }).onError((error, stackTrace) {
//       setTransactionList(ApiResponse.error(error.toString()));
//     });
//   }
// }
