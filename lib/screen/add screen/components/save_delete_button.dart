import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sqlite_database_tasks/main.dart';
import 'package:sqlite_database_tasks/model/expense_model.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

Center saveAndDeleteButton(ExpenseModel model, BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(defPadding * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                await showDeleteDialogue(context, model.id);
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: defPadding),
                padding: const EdgeInsets.symmetric(vertical: defPadding),
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
                  'Delete',
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
          Expanded(
            child: GestureDetector(
              onTap: () {
                DateTime dateTime = DateTime.now();
                final String date = DateFormat('dd/mm/yyyy').format(dateTime);
                Map map = {
                  'amount': double.parse(controller.txtAmount.text),
                  'category': expenseCategories[controller.selectedCat.value]
                      ['name'],
                  'description': controller.txtDescription.text,
                  'isIncome': controller.isIncome.value,
                  'date': date,
                  'id': model.id,
                };

                final ExpenseModel newModel = ExpenseModel.fromDb(map);

                controller.updateRecord(newModel);
                controller.resetControllers();
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: defPadding),
                padding: const EdgeInsets.symmetric(vertical: defPadding),
                alignment: Alignment.center,
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
                  'Save',
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
        ],
      ),
    ),
  );
}

Future<dynamic> showDeleteDialogue(BuildContext context, int id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        title: const Text('Delete Record'),
        content: const Text('Are you sure you want to delete this record?'),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child:  Text('Cancel', style: GoogleFonts.varelaRound(color: third),)),
          TextButton(onPressed: () {
            controller.deleteRecord(id: id);
            Get.back();
            Get.back();
          }, child:  Text('Delete', style: GoogleFonts.varelaRound(color: third),)),
        ],
      ),
    );
