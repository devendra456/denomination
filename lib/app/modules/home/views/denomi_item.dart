import 'package:auto_size_text/auto_size_text.dart';
import 'package:denomination/app/core/number_helper.dart';
import 'package:flutter/material.dart';

class DenomiItem extends StatefulWidget {
  final int amount;
  final void Function(int val) onChanged;
  final String? hintText;
  final TextEditingController? controller;

  const DenomiItem({
    super.key,
    required this.amount,
    required this.onChanged,
    this.hintText,
    this.controller,
  });

  @override
  State<DenomiItem> createState() => _DenomiItemState();
}

class _DenomiItemState extends State<DenomiItem> {
  int value = 0;
  bool showClearButton = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: Text(
              "₹ ${formatNumberWithCommas(widget.amount)}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Text(
            "X",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(
            width: 140,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: widget.controller,
              onChanged: (val) {
                if (val.isNotEmpty) {
                  showClearButton = true;
                } else {
                  showClearButton = false;
                }
                final intVal = int.tryParse(val) ?? 0;
                value = intVal * widget.amount;
                widget.onChanged(value);
                setState(() {});
              },
              decoration: InputDecoration(
                isDense: true,
                hintText: widget.hintText,
                contentPadding: const EdgeInsets.all(8),
                suffixIcon: showClearButton
                    ? IconButton(
                        onPressed: () {
                          widget.controller?.clear();
                          value = 0;
                          showClearButton = false;
                          widget.onChanged(value);
                          setState(() {});
                        },
                        icon: const Icon(Icons.cancel_rounded),
                      )
                    : const SizedBox(),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Text(
            "=",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AutoSizeText(
              "₹ ${formatNumberWithCommas(value)}",
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }

}
