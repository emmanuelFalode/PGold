import 'package:pgold_wallet/data/models/transaction_model.dart';

class ReportService {


  Future<bool> verifyTransactionPin(String pin) async {

    await Future.delayed(
      const Duration(seconds: 1),
    );


    if (pin == "1234") {
      return true;
    }


    throw Exception("Incorrect transaction PIN");
  }



  Future<bool> submitTransactionReport({
    required String transactionId,
    required String reason,
    required String description,
  }) async {


    await Future.delayed(
      const Duration(seconds: 2),
    );


    // simulate successful submission
    return true;
  }

}