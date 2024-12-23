import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/utils.dart';

import '../../../theme/theme_data.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defPadding * 2),
      child: SizedBox(
        height: height * 0.14,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: defPadding),
          itemCount: expenseCategories.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Container(
              width: 90,
              margin: const EdgeInsets.symmetric(horizontal: defPadding / 1),
              padding: const EdgeInsets.all(defPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color:
                      index == 0 ? third.withOpacity(0.2) : Colors.transparent,
                  border: Border.all(
                    color: index == 0 ? third : Colors.grey,
                    width: index == 0 ? 1.8 : 1.1,
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // CATEGORY ICON
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: expenseCategories[index]['color'],
                    child: Icon(expenseCategories[index]['icon']),
                  ),

                  const SizedBox(
                    height: defPadding / 2,
                  ),

                  // CATEGORY NAME
                  Expanded(
                    child: Center(
                      child: Text(
                        expenseCategories[index]['name'],
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: height * 0.015,
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
