// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReportStore on _ReportStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_ReportStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_ReportStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$reportSubmittedAtom = Atom(
    name: '_ReportStore.reportSubmitted',
    context: context,
  );

  @override
  bool get reportSubmitted {
    _$reportSubmittedAtom.reportRead();
    return super.reportSubmitted;
  }

  @override
  set reportSubmitted(bool value) {
    _$reportSubmittedAtom.reportWrite(value, super.reportSubmitted, () {
      super.reportSubmitted = value;
    });
  }

  late final _$verifyPinAsyncAction = AsyncAction(
    '_ReportStore.verifyPin',
    context: context,
  );

  @override
  Future<bool> verifyPin(String pin) {
    return _$verifyPinAsyncAction.run(() => super.verifyPin(pin));
  }

  late final _$submitReportAsyncAction = AsyncAction(
    '_ReportStore.submitReport',
    context: context,
  );

  @override
  Future<void> submitReport({
    required String transactionId,
    required String reason,
    required String description,
  }) {
    return _$submitReportAsyncAction.run(
      () => super.submitReport(
        transactionId: transactionId,
        reason: reason,
        description: description,
      ),
    );
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
reportSubmitted: ${reportSubmitted}
    ''';
  }
}
