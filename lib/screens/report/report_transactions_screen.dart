import 'package:flutter/material.dart';
import 'package:pgold_wallet/data/models/transaction_model.dart';
import 'package:pgold_wallet/general_widgets/pin_dialog.dart';
import 'package:pgold_wallet/stores/dashboard/dashboard_store.dart';

class ReportTransactionScreen extends StatefulWidget {
  final DashboardStore store;
  final TransactionModel transaction;

  const ReportTransactionScreen({
    super.key,
    required this.transaction,
    required this.store,
  });

  @override
  State<ReportTransactionScreen> createState() =>
      _ReportTransactionScreenState();
}

class _ReportTransactionScreenState extends State<ReportTransactionScreen> {
  final TextEditingController descriptionController =
      TextEditingController();

  String? selectedReason;

  bool isSubmitting = false;

  final reasons = [
    "Erroneous transfer",
    "Suspected fraud",
    "Wrong amount",
    "Duplicate transaction",
    "Other",
  ];

  bool get isValid {
    return selectedReason != null &&
        descriptionController.text.trim().length >= 20 &&
        descriptionController.text.trim().length <= 250;
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> submitReport() async {
    final verified = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => PinDialog(
        onVerify: widget.store.verifyTransactionPin,
      ),
    );

    if (verified != true) return;

    setState(() {
      isSubmitting = true;
    });

    try {
      await widget.store.submitTransactionReport(
        transactionId: widget.transaction.id,
        reason: selectedReason!,
        description: descriptionController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Report submitted successfully."),
        ),
      );

      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report Transaction"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reason",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedReason,
              hint: const Text("Select reason"),
              items: reasons
                  .map(
                    (reason) => DropdownMenuItem(
                      value: reason,
                      child: Text(reason),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedReason = value;
                });
              },
            ),
            const SizedBox(height: 25),
            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              maxLength: 250,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                hintText: "Explain the issue (minimum 20 characters)",
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isValid && !isSubmitting
                    ? submitReport
                    : null,
                child: isSubmitting
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text("Submit Report"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}