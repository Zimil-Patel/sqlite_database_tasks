import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/controller/home_controller.dart';
import 'package:sqlite_database_tasks/screen/home%20screen/components/add_record_dialog.dart';
import 'package:sqlite_database_tasks/utils.dart';

import 'components/expense_list_view.dart';
import 'components/filter_row.dart';
import 'components/smart_card.dart';

HomeController controller = Get.put(HomeController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Hey!\n\t\t\tStaR BoY',
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
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defPadding),
            child: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

      // BODY
      body: SingleChildScrollView(
        child: Column(
          children: [
            // CARD - BALANCE, EXPENSE, INCOME
            const SmartCard(),

            // ALL - EXPENSE - INCOME
            const FilterRow(),

            // TRANSACTIONS
            Obx(
              () => controller.expenseList.isNotEmpty
                  ? ExpenseListView(controller: controller)
                  : const Center(
                      child: Text(
                        'No data found!',
                      ),
                    ),
            ),


            SizedBox(
              height: defPadding * 10,
            ),
          ],
        ),
      ),

      // FLOATING ACTION BUTTON
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: defPadding * 1.5,
          horizontal: defPadding / 2,
        ),
        child: FloatingActionButton(
          onPressed: () async {
            await addRecordDialog(context);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
