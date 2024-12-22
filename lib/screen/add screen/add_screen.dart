import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/utils.dart';

import 'components/add_record_button.dart';
import 'components/amount_des_text_field.dart';
import 'components/categories_grid_view.dart';
import 'components/transaction_type_radio.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Record',
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
      body: Hero(
        tag: 'addScreen',
        child: SingleChildScrollView(
          child: Column(
            children: [
              // AMOUNT
              buildAmountDesTextField(),

              // IS INCOME OR EXPENSE
              const TransactionTypeRadio(),

              // CATEGORY
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // HEADING
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defPadding),
                    child: Row(
                      children: [
                        const Icon(Icons.category_rounded),
                        const SizedBox(
                          width: defPadding,
                        ),
                        Expanded(
                          child: Text(
                            'Select category',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: defPadding,
                  ),

                  // LIST OF CATEGORIES
                  const CategoriesGridView(),

                  // CATEGORY LIST ICONS
                ],
              ),

              // SAVE RECORD BUTTON
              addRecordButton(),
            ],
          ),
        ),
      ),
    );
  }
}
