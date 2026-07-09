import 'package:mobx/mobx.dart';
import 'package:pgold_wallet/data/repos/report_repository.dart';

part 'report_store.g.dart';


class ReportStore = _ReportStore with _$ReportStore;



abstract class _ReportStore with Store {


  final ReportRepository repository;


  _ReportStore(this.repository);



  @observable
  bool isLoading = false;


  @observable
  String? errorMessage;



  @observable
  bool reportSubmitted = false;



  @action
  Future<bool> verifyPin(String pin) async {

    try {

      return await repository.verifyPin(pin);

    } catch(e){

      errorMessage = e.toString();

      return false;

    }

  }



  @action
  Future<void> submitReport({
    required String transactionId,
    required String reason,
    required String description,
  }) async {


    isLoading = true;


    try {

      await repository.submitReport(
        transactionId: transactionId,
        reason: reason,
        description: description,
      );


      reportSubmitted = true;


    }catch(e){

      errorMessage = e.toString();

    }
    finally{

      isLoading = false;

    }

  }

}