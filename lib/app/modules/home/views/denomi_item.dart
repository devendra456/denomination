import 'package:auto_size_text/auto_size_text.dart';
import 'package:denomination/app/core/helpers/number_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/denomi_model.dart';

class DenomiItem extends StatelessWidget {
  final void Function(String val) onChanged;
  final void Function() onClearButtonTap;
  final DenomiModel denomiModel;

  const DenomiItem({
    super.key,
    required this.onChanged,
    required this.onClearButtonTap,
    required this.denomiModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: Text(
              "₹ ${formatNumberWithCommas(denomiModel.amount)}",
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
              controller: denomiModel.controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                isDense: true,
                hintText: denomiModel.hintText,
                contentPadding: const EdgeInsets.all(8),
                suffixIcon: Obx(() {
                  return denomiModel.showClearButton.value
                      ? IconButton(
                          onPressed: onClearButtonTap,
                          icon: const Icon(Icons.cancel_rounded),
                        )
                      : const SizedBox();
                }),
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
            child: Obx(() {
              return AutoSizeText(
                "₹ ${formatNumberWithCommas(denomiModel.value.value)}",
                maxLines: 1,
                style: Theme.of(context).textTheme.titleLarge,
              );
            }),
          ),
        ],
      ),
    );
  }
}
