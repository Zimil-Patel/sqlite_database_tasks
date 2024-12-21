import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Material(
        color: Colors.transparent,
        child: GridView.builder(
          itemCount: expenseCategories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(defPadding),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 4,

          ),
          itemBuilder: (context, index) => CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {  },
            child: Container(
              width: 90,
              padding: const EdgeInsets.all(defPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: index == 0 ? third.withOpacity(0.2) : Colors.transparent,
                  border: Border.all(
                    color: index == 0 ? third : Colors.grey,
                    width: index == 0? 1.8 : 1.1,
                  )
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [


                  // CATEGORY ICON
                  Expanded(
                    flex: 3,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: expenseCategories[index]
                      ['color'],
                      child: Icon(expenseCategories[index]['icon']),
                    ),
                  ),

                  
                  const SizedBox(
                    height: defPadding / 2,
                  ),


                  // CATEGORY NAME
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        expenseCategories[index]['name'],
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
