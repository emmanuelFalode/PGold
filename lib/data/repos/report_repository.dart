import 'package:pgold_wallet/data/services/report_service.dart';


class ReportRepository {
  final ReportService _service;
  ReportRepository(this._service);
  Future<bool> verifyPin(String pin){

    return _service.verifyTransactionPin(pin);

  }



  Future<bool> submitReport({
    required String transactionId,
    required String reason,
    required String description,
  }){

    return _service.submitTransactionReport(
      transactionId: transactionId,
      reason: reason,
      description: description,
    );

  }

}