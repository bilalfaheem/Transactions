import 'package:transactions/data/network/base_api_services.dart';
import 'package:transactions/data/network/network_api_services.dart';
import 'package:transactions/model/transaction_model/transaction_model.dart';
import '../resource/app_urls.dart';

class TransactionRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> transactionApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.transactionUrl);
      List<TransactionModel> transactionList = [];
      for (var item in response) {
        transactionList.add(TransactionModel.fromJson(item));
      }
      return transactionList;
    } catch (e) {
      throw e;
    }
  }
}
