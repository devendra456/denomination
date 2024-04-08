import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback? onTapPositive;
  final VoidCallback? onTapNegative;
  final String positiveButtonText;
  final String negativeButtonText;
  final String title;
  final String? subTitle;

  const ConfirmationDialog({
    this.onTapPositive,
    this.onTapNegative,
    super.key,
    required this.positiveButtonText,
    required this.negativeButtonText,
    required this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, top: 16, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.error_outline_outlined,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            if (subTitle != null)
            const SizedBox(
              height: 8,
            ),
            if (subTitle != null)
              Text(
                subTitle!,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onTapNegative,
                  child: Text(
                    negativeButtonText,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                TextButton(
                  onPressed: onTapPositive,
                  child: Text(positiveButtonText),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
