import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../main.dart';
import '../home screen/components/expense_list_view.dart';
import '../home screen/components/search_button.dart';
import 'components/category_list_view.dart';

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
              () => controller.expenseList.isNotEmpty
                  ? ExpenseListView(controller: controller)
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
