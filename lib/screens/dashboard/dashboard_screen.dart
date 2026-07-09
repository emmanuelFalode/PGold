import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pgold_wallet/core/utils/color_utils.dart';
import 'package:pgold_wallet/general_widgets/transaction_list.dart';
import 'package:pgold_wallet/general_widgets/wallet_balance_card.dart';
import 'package:pgold_wallet/stores/dashboard/dashboard_store.dart';

class DashboardScreen extends StatefulWidget {
  final DashboardStore store;

  const DashboardScreen({
    super.key,
    required this.store,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    widget.store.loadDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (widget.store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (widget.store.errorMessage != null) {
            return Center(
              child: Text(widget.store.errorMessage!),
            );
          }

          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: PGoldColors.primary,
                ),
              ),
              SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 13,
                      ),
                      child: Text(
                        "Welcome back!",
                        style: TextStyle(
                          color: PGoldColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Text(
                        widget.store.user?.name ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: WalletBalanceCard(
                        user: widget.store.user,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await widget.store.loadDashboard();
                          },
                          child: SingleChildScrollView(
                            physics:
                                const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Transactions",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TransactionList(
                                  transactions:
                                      widget.store.transactions.toList(),
                                  store: widget.store,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}