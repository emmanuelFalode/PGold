import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pgold_wallet/core/utils/transaction_rules.dart';
import 'package:pgold_wallet/data/models/transaction_model.dart';
import 'package:pgold_wallet/screens/report/report_transactions_screen.dart';
import 'package:pgold_wallet/stores/dashboard/dashboard_store.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final TransactionModel transaction;
  final DashboardStore store;

  const TransactionDetailsScreen({
    super.key,
    required this.transaction,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final currentTransaction = store.transactions.firstWhere(
          (t) => t.id == transaction.id,
        );

        Color statusColor;

        switch (currentTransaction.status.toLowerCase()) {
          case "successful":
            statusColor = Colors.green;
            break;
          case "pending":
            statusColor = Colors.orange;
            break;
          case "failed":
            statusColor = Colors.red;
            break;
          default:
            statusColor = Colors.grey;
        }

        final canReport = TransactionRules.canReport(currentTransaction);

        return Scaffold(
          appBar: AppBar(title: const Text("Transaction Details")),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: statusColor.withOpacity(0.15),
                    child: Icon(
                      Icons.receipt_long,
                      size: 35,
                      color: statusColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    currentTransaction.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    "₦${currentTransaction.amount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      currentTransaction.status.toUpperCase(),
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                _InfoTile(
                  title: "Reference",
                  value: currentTransaction.reference,
                ),
                _InfoTile(
                  title: "Description",
                  value: currentTransaction.description,
                ),
                _InfoTile(
                  title: "Date",
                  value: DateFormat.yMMMd().add_jm().format(
                    DateTime.parse(currentTransaction.date),
                  ),
                ),
                _InfoTile(
                  title: "Transaction Type",
                  value: currentTransaction.type,
                ),
                const SizedBox(height: 15),
                if (canReport)
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        final reported = await context.push<bool>(
                          '/report-transaction',
                          extra: currentTransaction,
                        );

                        if (reported == true) {
                          // Observer will rebuild automatically because MobX updated.
                        }
                        if (reported == true) {}
                      },
                      child: const Text(
                        "Report Transaction",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      TransactionRules.reportMessage(currentTransaction),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String value;

  const _InfoTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
