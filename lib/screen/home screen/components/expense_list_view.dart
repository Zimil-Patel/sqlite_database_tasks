import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/controller/home_controller.dart';
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
      itemBuilder: (context, index) => Card(
        color: controller.expenseList[index].isIncome ? Colors.green.shade200 : Colors.red.shade200,
        child: ListTile(
          leading: Text(
            "PK ${controller.expenseList[index].id.toString()}",
            style: TextStyle(
              fontSize: height * 0.018,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              controller.deleteRecord(
                  id: controller.expenseList[index].id);
            },
            icon: const Icon(Icons.delete),
          ),
          title: Text(
              "\$ ${controller.expenseList[index].amount.toString()}"),

          subtitle: Text(
              controller.expenseList[index].category),
        ),
      ),
      itemCount: controller.expenseList.length,
    );
  }
}
