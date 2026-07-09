import 'package:mobx/mobx.dart';
import 'package:pgold_wallet/data/mock/mock_data.dart';
import 'package:pgold_wallet/data/models/transaction_model.dart';
import 'package:pgold_wallet/data/models/user_model.dart';

class MockService {
Future<UserModel> fetchDashboard() async {
await Future.delayed(const Duration(seconds: 1));
return mockUsers;
}

Future<List<TransactionModel>> fetchTransactions() async {
  await Future.delayed(const Duration(seconds: 1));
  return mockTransactions;
}

Future<TransactionModel> fetchTransactionById(String id) async {
  await Future.delayed(const Duration(seconds: 1));
  try{
    return mockTransactions.firstWhere(
      (transaction) => transaction.id == id
    );
  }catch(e){
    throw Exception("Transaction not found");
  }
}

Future<bool> verifyTransactionPin(String pin) async {
  await Future.delayed(const Duration(seconds: 1));

  return pin == "1234";
}

Future<void> submitTransactionReport({
  required String transactionId,
  required String reason,
  required String description,
}) async {
  await Future.delayed(const Duration(seconds: 1));

  final transaction = mockTransactions.firstWhere(
    (t) => t.id == transactionId,
  );

  if (transaction.hasActiveReport) {
    throw Exception("This transaction has already been reported.");
  }

  transaction.hasActiveReport = true;
}
}