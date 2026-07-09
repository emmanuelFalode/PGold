// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardStore on _DashboardStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_DashboardStore.isLoading',
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
    name: '_DashboardStore.errorMessage',
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

  late final _$userAtom = Atom(name: '_DashboardStore.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$transactionsAtom = Atom(
    name: '_DashboardStore.transactions',
    context: context,
  );

  @override
  ObservableList<TransactionModel> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<TransactionModel> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  late final _$pinAttemptsAtom = Atom(
    name: '_DashboardStore.pinAttempts',
    context: context,
  );

  @override
  int get pinAttempts {
    _$pinAttemptsAtom.reportRead();
    return super.pinAttempts;
  }

  @override
  set pinAttempts(int value) {
    _$pinAttemptsAtom.reportWrite(value, super.pinAttempts, () {
      super.pinAttempts = value;
    });
  }

  late final _$pinBlockedAtom = Atom(
    name: '_DashboardStore.pinBlocked',
    context: context,
  );

  @override
  bool get pinBlocked {
    _$pinBlockedAtom.reportRead();
    return super.pinBlocked;
  }

  @override
  set pinBlocked(bool value) {
    _$pinBlockedAtom.reportWrite(value, super.pinBlocked, () {
      super.pinBlocked = value;
    });
  }

  late final _$loadDashboardAsyncAction = AsyncAction(
    '_DashboardStore.loadDashboard',
    context: context,
  );

  @override
  Future<void> loadDashboard() {
    return _$loadDashboardAsyncAction.run(() => super.loadDashboard());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
user: ${user},
transactions: ${transactions},
pinAttempts: ${pinAttempts},
pinBlocked: ${pinBlocked}
    ''';
  }
}
