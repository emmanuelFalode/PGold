import 'package:flutter/material.dart';

class PinDialog extends StatefulWidget {
  final Future<bool> Function(String pin) onVerify;

  const PinDialog({
    super.key,
    required this.onVerify,
  });

  @override
  State<PinDialog> createState() => _PinDialogState();
}

class _PinDialogState extends State<PinDialog> {
  final TextEditingController controller = TextEditingController();

  bool isLoading = false;
  String? error;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> verify() async {
    if (controller.text.length != 4) {
      setState(() {
        error = "Enter a valid 4-digit PIN.";
      });
      return;
    }

    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final success = await widget.onVerify(controller.text);

      if (success) {
        controller.clear();

        if (mounted) {
          Navigator.pop(context, true);
        }
      }
    } catch (e) {
      controller.clear();

      if (mounted) {
        setState(() {
          error = e.toString().replaceFirst("Exception: ", "");
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Transaction PIN"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Enter your 4-digit transaction PIN",
          ),
          const SizedBox(height: 15),
          TextField(
            controller: controller,
            obscureText: true,
            maxLength: 4,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: "",
            ),
          ),
          if (error != null) ...[
            const SizedBox(height: 10),
            Text(
              error!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: isLoading
              ? null
              : () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: isLoading ? null : verify,
          child: isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : const Text("Verify"),
        ),
      ],
    );
  }
}