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

          Material(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // INCOME
                Expanded(
                  child: Row(
                    children: [
                      Radio<int>(
                        value: 0,
                        groupValue: 0,
                        onChanged: (value){},
                        activeColor: third,
                      ),
                      const SizedBox(width: defPadding / 2,),
                      Flexible(child: Text('Income', style: TextStyle(fontSize: height * 0.019), overflow: TextOverflow.ellipsis,)),
                    ],
                  ),
                ),

                const SizedBox(width: defPadding / 2,),

                Expanded(
                  child: Row(
                    children: [
                      Radio<int>(
                        value: 1,
                        groupValue: 0,
                        onChanged: (value){},
                        activeColor: third,
                      ),
                      const SizedBox(width: defPadding / 2,),
                      Flexible(child: Text('Expense', style: TextStyle(fontSize: height * 0.019),overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),


                // EXPENSE

              ],
            ),
          ),
        ],
      ),
    );
  }
}
