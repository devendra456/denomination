import 'package:denomination/app/core/helpers/number_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: FutureBuilder(
        future: controller.getSaveData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              final data = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final item = data[index];
                  final date = DateTime.parse("${item["dateTime"]}");
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${item["type"]}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "₹ ${formatNumberWithCommas(item["amount"] as int)}",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: switch (item["type"]) {
                                    "Income" => Colors.green,
                                    "Expense" => Colors.red,
                                    "General" => Colors.blue,
                                    _ => Colors.blue,
                                  }),
                        ),
                      ],
                    ),
                    subtitle: (item["remarks"] != null && item["remarks"] != "")
                        ? Text(
                            "${item["remarks"]}",
                          )
                        : null,
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateFormat.yMMMMd().format(date)),
                        Text(DateFormat(DateFormat.HOUR_MINUTE).format(date))
                      ],
                    ),
                  );
                },
                itemCount: data.length,
              );
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
