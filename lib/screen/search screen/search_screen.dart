import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../main.dart';
import '../../utils.dart';
import '../home screen/components/expense_list_view.dart';
import 'components/search_field.dart';
import 'components/search_icon.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transactions',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // SEARCH BAR
            Hero(
              tag: 'searchBar',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(defPadding / 1.9),
                      margin:
                          const EdgeInsets.symmetric(horizontal: defPadding),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          // SEARCH FIELD
                          searchField(context),


                          // SEARCH ICON
                          searchIcon(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


            const SizedBox(
              height: defPadding,
            ),

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
          ],
        ),
      ),
    );
  }




}
