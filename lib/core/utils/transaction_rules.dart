import 'package:pgold_wallet/data/models/transaction_model.dart';

class TransactionRules {
  static bool canReport(TransactionModel transaction) {
    if (transaction.hasActiveReport) {
      return false;
    }

    final status = transaction.status.toLowerCase();

    if (status == "failed") {
      return false;
    }

    if (status == "reversed") {
      return false;
    }

    return true;
  }

  static String reportMessage(TransactionModel transaction) {
    if (transaction.hasActiveReport) {
      return "This transaction has already been reported.";
    }

    final status = transaction.status.toLowerCase();

    if (status == "failed") {
      return "Failed transactions cannot be reported.";
    }

    if (status == "reversed") {
      return "Reversed transactions cannot be reported.";
    }

    return "";
  }
}