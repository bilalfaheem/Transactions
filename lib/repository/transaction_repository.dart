import 'package:transactions/data/network/base_api_services.dart';
import 'package:transactions/data/network/network_api_services.dart';
import 'package:transactions/model/transaction_model/transaction_model.dart';
import '../resource/app_urls.dart';

List<TransactionModel> transactionList = [];

class TransactionRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<List<TransactionModel>> fetchTransactionList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.transactionUrl);
      transactionList.clear();

      for (var item in response) {
        transactionList.add(TransactionModel.fromJson(item));
      }
      transactionList.sort((a, b) => b.date!.compareTo(a.date!));
      return transactionList;
    } catch (e) {
      throw e;
    }
  }
}
