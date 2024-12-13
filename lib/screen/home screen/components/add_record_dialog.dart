
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

import '../../../main.dart';

addRecordDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text(
        'Add Record',
        style: TextStyle(color: third),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldWithLabel(
            label: 'Amount',
            textController: controller.txtAmount,
            textInputType: TextInputType.number,
          ),
          TextFieldWithLabel(
            label: 'Category',
            textController: controller.txtCategory,
          ),
          Obx(() => SwitchListTile(
            activeTrackColor: third.withOpacity(0.6),
            inactiveTrackColor: secondary.withOpacity(0.4),
            contentPadding: EdgeInsets.zero,
            onChanged: controller.setIsIncomeSwitch,
            title: Text(
              'Credit',
              style: TextStyle(
                  fontSize: height * 0.02, color: Colors.white70),
            ),
            value: controller.isIncome.value,
          )),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            controller.resetControllers();
          },
          child: const Text(
            'Close',
            style: TextStyle(color: third),
          ),
        ),
        TextButton(
          onPressed: () {
            try {
              double amt = double.parse(controller.txtAmount.text);
              bool isIncome = controller.isIncome.value;
              String category = controller.txtCategory.text;
              DateTime date = DateTime.now();
              String stringDate =
                  "${date.day} / ${date.month} / ${date.year}";

              controller.insertRecord(
                  amt: amt,
                  category: category,
                  isIncome: isIncome,
                  date: stringDate);

              Navigator.of(context).pop();
              controller.resetControllers();
            } catch (e) {
              log("Error: Invalid amount entered.");
            }
          },
          child: const Text(
            'Save',
            style: TextStyle(color: third),
          ),
        ),
      ],
    ),
  );
}

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    super.key,
    required this.label,
    this.textInputType,
    required this.textController,
  });

  final String label;
  final TextInputType? textInputType;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defPadding),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                style:
                    TextStyle(fontSize: height * 0.015, color: Colors.white70),
              ),
            ],
          ),
          TextFormField(
            controller: textController,
            cursorColor: third,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus!.unfocus();
            },
            style: const TextStyle(
              color: Colors.white,
            ),
            keyboardType: textInputType ?? TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Enter $label',
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70, width: 1.5),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: third, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
