import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/model/expense_model.dart';
import 'package:sqlite_database_tasks/screen/home%20screen/home_screen.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

import 'add_record_dialog.dart';

updateRecordDialog(BuildContext context, ExpenseModel model) {
  controller.txtAmount = TextEditingController(text: model.amount.toString());
  controller.txtCategory = TextEditingController(text: model.category);
  controller.setIsIncomeSwitch(model.isIncome);

  showDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    builder: (context) => AlertDialog(
      title: const Text(
        'Edit Record',
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
          Obx(
            () => SwitchListTile(
              trackOutlineColor:
                  const WidgetStatePropertyAll(Colors.transparent),
              activeColor: third,
              inactiveTrackColor: secondary.withOpacity(0.4),
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              onChanged: (value) {
                controller.setIsIncomeSwitch(value);
              },
              title: Text(
                'Credit',
                style:
                    TextStyle(fontSize: height * 0.015, color: Colors.white70),
              ),
              value: controller.isIncome.value,
            ),
          ),
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
              String stringDate = "${date.day} / ${date.month} / ${date.year}";

              controller.updateRecord(
                id: model.id,
                amt: amt,
                category: category,
                isIncome: isIncome,
                date: stringDate,
              );

              Navigator.of(context).pop();
              controller.resetControllers();
            } catch (e) {
              log("Error: Invalid amount entered.");
            }
            controller.resetControllers();
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
