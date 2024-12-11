import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/controller/home_controller.dart';
import 'package:sqlite_database_tasks/screen/home%20screen/components/update_record_dialog.dart';
import 'package:sqlite_database_tasks/utils.dart';

class ExpenseListView extends StatelessWidget {
  const ExpenseListView({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: defPadding),
      itemBuilder: (context, index) => Card(
        color: controller.expenseList[index].isIncome
            ? Colors.green.shade200
            : Colors.red.shade200,
        child: ListTile(
          leading: Icon(controller.expenseList[index].isIncome
              ? Icons.arrow_downward
              : Icons.arrow_upward_rounded),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  updateRecordDialog(context, controller.expenseList[index]);
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  controller.deleteRecord(id: controller.expenseList[index].id);
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          title: Text(
            "\$ ${controller.expenseList[index].amount.toString()}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "${controller.expenseList[index].category} - ${controller.expenseList[index].date}",
            style: TextStyle(
              fontSize: height * 0.015,
              color: Colors.white,
            ),
          ),
        ),
      ),
      itemCount: controller.expenseList.length,
    );
  }
}
