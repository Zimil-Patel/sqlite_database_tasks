import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/controller/home_controller.dart';
import 'package:sqlite_database_tasks/utils.dart';

import 'components/expense_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Hey!\n\t\tStaR BoY',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 10,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),

      // BODY
      body: Obx(() => controller.expenseList.isNotEmpty
          ? ExpenseListView(controller: controller)
          : Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            )),

      // FLOATING ACTION BUTTON
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: defPadding * 1.5,
          horizontal: defPadding / 2,
        ),
        child: FloatingActionButton(
          onPressed: () {
            final date = DateTime.now();
            final stringDate = "${date.day} / ${date.month} / ${date.year}";
            controller.insertRecord(
                amt: 5000,
                category: 'From Dad',
                isIncome: true,
                date: stringDate);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

