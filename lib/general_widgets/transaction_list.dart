import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pgold_wallet/data/models/transaction_model.dart';
import 'package:pgold_wallet/stores/dashboard/dashboard_store.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;
  final DashboardStore store;

  const TransactionList({
    super.key,
    required this.transactions,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(
        child: Text("No transactions available"),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final tran = transactions[index];

        Color statusColor;
        IconData statusIcon;

        switch (tran.status.toLowerCase()) {
          case "successful":
            statusColor = Colors.green;
            statusIcon = Icons.check_circle_outline;
            break;

          case "pending":
            statusColor = Colors.orange;
            statusIcon = Icons.hourglass_top_rounded;
            break;

          case "failed":
            statusColor = Colors.red;
            statusIcon = Icons.cancel_outlined;
            break;

          default:
            statusColor = Colors.grey;
            statusIcon = Icons.help_outline;
        }

        return Material(
          color: Colors.transparent,
          child: ListTile(
            contentPadding: EdgeInsets.zero,

            leading: CircleAvatar(
              backgroundColor: statusColor.withOpacity(0.15),
              child: Icon(
                statusIcon,
                color: statusColor,
              ),
            ),

            title: Text(
              tran.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tran.status.toUpperCase(),
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  DateFormat.yMMMd().format(
                    DateTime.parse(tran.date),
                  ),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            trailing: Text(
              "₦${tran.amount.toStringAsFixed(2)}",
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            onTap: () {
              context.push(
                '/transaction-details',
                extra: tran,
              );
            },
          ),
        );
      },
    );
  }
}