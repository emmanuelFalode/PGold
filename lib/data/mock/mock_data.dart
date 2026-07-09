import 'package:pgold_wallet/data/models/transaction_model.dart';
import 'package:pgold_wallet/data/models/user_model.dart';

final mockUsers = UserModel(
  name: "Emmanuel",
  walletBalance: 20000,
  kycLevel: "Tier 3",
);

final List<TransactionModel> mockTransactions = [ 

TransactionModel(
  id: "txn_001",
  reference: "PG-20260707-001",
  title: "Wallet Funding",
  amount: 50000,
  fee: 0,
  type: "wallet_funding",
  status: "successful",
  direction: "credit",
  description: "Wallet funded via bank transfer",
  date: "2026-07-07T10:30:00Z",
  hasActiveReport: false,
),

TransactionModel(
  id: "txn_002",
  reference: "PG-20260707-002",
  title: "Withdrawal",
  amount: 20000,
  fee: 100,
  type: "wallet_funding",
  status: "pending",
  direction: "debit",
  description: "withdrawal to saved bank account",
  date: "2026-07-07T12:10:00Z",
  hasActiveReport: false,
),

TransactionModel(
  id: "txn_003",
  reference: "PG-20260707-003",
  title: "Gift Card Trade",
  amount: 85000,
  fee: 0,
  type: "gift_card_trade",
  status: "failed",
  direction: "credit",
  description: "Gift card trade payout",
  date: "2026-07-06T09:15:00Z",
  hasActiveReport: false,
),

TransactionModel(
  id: "txn_004",
  reference: "PG-20260707-004",
  title: "Crypto Trade",
  amount: 120000,
  fee: 500,
  type: "crypto_trade",
  status: "successful",
  direction: "credit",
  description: "Crypto sale payout",
  date: "2026-07-05T16:45:00Z",
  hasActiveReport: true,
),

TransactionModel(
  id: "txn_005",
  reference: "PG-20260707-005",
  title: "Bank Transfer",
  amount: 15000,
  fee: 0,
  type: "bank_transfer",
  status: "reversed",
  direction: "debit",
  description: "Transaction reversed by the system",
  date: "2026-07-08T08:45:00Z",
  hasActiveReport: false,
),
];
