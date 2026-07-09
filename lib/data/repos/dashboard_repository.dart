import 'package:flutter/material.dart';
import 'package:pgold_wallet/data/models/transaction_model.dart';
import 'package:pgold_wallet/data/models/user_model.dart';
import 'package:pgold_wallet/data/services/mock_service.dart';


class DashboardRepository {
  final MockService _service;

  DashboardRepository(this._service);

  // fetchDashboard()
  Future<UserModel> fetchDashboard(){
    return _service.fetchDashboard();
  }

  // fetchTransactions()
  Future<List<TransactionModel>> fetchTransactions(){
    return _service.fetchTransactions();
  }
Future<bool> verifyTransactionPin(String pin) {
  return _service.verifyTransactionPin(pin);
}

Future<void> submitTransactionReport({
  required String transactionId,
  required String reason,
  required String description,
}) {
  return _service.submitTransactionReport(
    transactionId: transactionId,
    reason: reason,
    description: description,
  );
}
  

}