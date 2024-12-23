import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_database_tasks/screen/filter%20screen/components/category_expense_listview.dart';
import '../../controller/filter_controller.dart';
import '../home screen/components/search_button.dart';
import 'components/category_list_view.dart';

FilterController filterController = Get.put(FilterController());

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter by category',
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
          SearchButton(),
        ],
      ),

      // BODY
      body: SingleChildScrollView(
        child: Column(
          children: [
            // CATEGORY LIST
            const CategoryListView(),

            // SELECTED CATEGORY RESULT
            Obx(
              () => filterController.categoryList.isNotEmpty
                  ? CategoryExpenseListview(controller: filterController)
                  : Center(
                      child: Text(
                        'No transaction found!',
                        style: GoogleFonts.varelaRound(
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
