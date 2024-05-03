import 'package:daytrit/authentication/repo/api_status.dart';
import 'package:daytrit/home/models/dataModel/transaction_model.dart';
import 'package:daytrit/home/repo/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionViewModel extends ChangeNotifier {
  TransactionService service = TransactionService();

  bool _loading = false;
  List<TransactionModel> transact = <TransactionModel>[];

  TransactionModel? transaction;

  bool get loading => _loading;

  //ProfileViewModel();

  Map<String, dynamic>? decodedData;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<bool> getTransaction() async {
    setLoading(true);
    try {
      final ApiResponse response = await TransactionService().getTransaction();
      if (response is Success) {
        transact = response.data as List<TransactionModel>;
      } else {
        return false;
      }
      setLoading(false);
      return true;
    } catch (e) {
      setLoading(false);
      return false;
    }
  }
}

//
