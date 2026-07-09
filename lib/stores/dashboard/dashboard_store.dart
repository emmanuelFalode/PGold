import 'package:mobx/mobx.dart';
import 'package:pgold_wallet/data/models/transaction_model.dart';
import 'package:pgold_wallet/data/models/user_model.dart';
import 'package:pgold_wallet/data/repos/dashboard_repository.dart';
part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStore with _$DashboardStore;
abstract class _DashboardStore with Store{

@observable
bool isLoading = false;

@observable
String? errorMessage;

@observable
UserModel? user;

@observable
ObservableList<TransactionModel> transactions = ObservableList<TransactionModel>();

@observable
int pinAttempts = 0;

@observable
bool pinBlocked = false;

Future<bool> verifyTransactionPin(String pin) async {
  await Future.delayed(const Duration(seconds: 1));

  if (pinBlocked) {
    throw Exception(
      "PIN has been blocked after 3 failed attempts.",
    );
  }

  if (pin == "1234") {
    pinAttempts = 0;
    return true;
  }

  pinAttempts++;

  if (pinAttempts >= 3) {
    pinBlocked = true;
    throw Exception(
      "Too many incorrect attempts. PIN has been blocked.",
    );
  }

  throw Exception(
    "Incorrect PIN.",
  );
}
Future<void> submitTransactionReport({
  required String transactionId,
  required String reason,
  required String description,
}) async {
  await Future.delayed(const Duration(seconds: 1));

  final transaction = transactions.firstWhere(
    (t) => t.id == transactionId,
    orElse: () => throw Exception(
      "Transaction not found.",
    ),
  );

  if (transaction.hasActiveReport) {
    throw Exception(
      "This transaction has already been reported.",
    );
  }

  transaction.hasActiveReport = true;

  transactions = ObservableList.of(transactions);
}

final DashboardRepository _repository;
_DashboardStore(this._repository);

@action
Future<void> loadDashboard() async{
  isLoading = true;
  errorMessage = null;

  try {
    final userData = await _repository.fetchDashboard();
    final transactionData = await _repository.fetchTransactions();

    user = userData;
    transactions
    ..clear()
    ..addAll(transactionData);

  }catch(e){
    errorMessage = e.toString();
  }finally{
    isLoading = false;
  }
}
}
