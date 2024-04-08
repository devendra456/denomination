import 'package:flutter/material.dart';

class RemarksDialog extends StatefulWidget {
  final Function(String type, String? remarks) onSavePressed;

  const RemarksDialog({super.key, required this.onSavePressed});

  @override
  State<RemarksDialog> createState() => _RemarksDialogState();
}

class _RemarksDialogState extends State<RemarksDialog> {
  String type = "General";
  String? remark;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: CloseButton(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField(
              isExpanded: true,
              value: type,
              decoration: const InputDecoration(
                  label: Text("Category"), border: OutlineInputBorder()),
              items: ["General", "Income", "Expense"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                type = value;
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Fill your remarks(if any)",
              ),
              onChanged: (val) {
                remark = val;
              },
              minLines: 2,
              maxLines: 3,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            height: 48,
            child: MaterialButton(
              onPressed: () {
                widget.onSavePressed(type, remark);
              },
              child: const Text("Save"),
            ),
          )
        ],
      ),
    );
  }
}
