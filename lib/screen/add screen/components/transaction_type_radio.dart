import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';

import '../../../utils.dart';


class TransactionTypeRadio extends StatelessWidget {
  const TransactionTypeRadio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defPadding, vertical: defPadding * 1.5),
      child: Column(
        children: [

          // HEADING
          Row(
            children: [
              const Icon(Icons.swap_vert_rounded),
              const SizedBox(
                width: defPadding,
              ),
              Expanded(
                child: Text(
                  'Transaction type',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),

          Row(
            children: [
              // INCOME
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: RadioListTile(
                    value: 0,
                    groupValue: 0,
                    onChanged: (value) {},
                    activeColor: third,
                    title: const Text('Income'),
                  ),
                ),
              ),


              // EXPENSE
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: RadioListTile(
                    value: 1,
                    groupValue: 0,
                    onChanged: (value) {},
                    activeColor: third,
                    title: const Text('Expense'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
