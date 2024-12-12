import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sqlite_database_tasks/screen/home%20screen/home_screen.dart';

import '../../theme/theme_data.dart';
import '../../utils.dart';
import '../home screen/components/expense_list_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Transaction',
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defPadding * 1.5),
                              child: Material(
                                color: Colors.transparent,
                                child: TextField(
                                  controller: controller.txtSearch,
                                  cursorColor:
                                      Theme.of(context).colorScheme.onSurface,
                                  onChanged: (value){
                                    controller.fetchFilterRecordByCategorySearch(value);
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Search category...',
                                    hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(0.5),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(defPadding / 1.2),
                            decoration: const BoxDecoration(
                                color: background, shape: BoxShape.circle),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.search,
                                size: height * 0.025,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
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
