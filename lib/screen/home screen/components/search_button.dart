import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_database_tasks/main.dart';
import 'package:sqlite_database_tasks/screen/search%20screen/search_screen.dart';

import '../../../theme/theme_data.dart';
import '../../../utils.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        await controller.fetchRecords();
        controller.txtSearch.clear();
        Get.to(() => const SearchScreen());
      },
      child: Hero(
        tag: 'searchBar',
        child: Container(
          padding: const EdgeInsets.all(defPadding / 1.9),
          margin: const EdgeInsets.symmetric(horizontal: defPadding),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            padding: const EdgeInsets.all(defPadding / 1.2),
            decoration:
                const BoxDecoration(color: background, shape: BoxShape.circle),
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
        ),
      ),
    );
  }
}
