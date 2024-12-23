import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqlite_database_tasks/main.dart';
import 'package:sqlite_database_tasks/model/expense_model.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

Center addRecordButton() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(defPadding * 2),
      child: CupertinoButton(
        onPressed: () {
          DateTime dateTime = DateTime.now();
          final String date = DateFormat('dd/mm/yyyy').format(dateTime);
          Map map = {
            'amount' : double.parse(controller.txtAmount.text),
            'category' : expenseCategories[controller.selectedCat.value]['name'],
            'description' : controller.txtDescription.text,
            'isIncome' : controller.isIncome.value,
            'date' : date,
          };

          final ExpenseModel model = ExpenseModel.fromDb(map);

          controller.insertRecord(model);
          controller.resetControllers();
          Get.back();

        },
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: defPadding * 3, vertical: defPadding * 1.2),
          decoration: BoxDecoration(
            color: third,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(
            'Add Record',
            style: TextStyle(
              fontSize: height * 0.02,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
