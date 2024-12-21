import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

Center addRecordButton() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(defPadding * 2),
      child: CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: defPadding * 3, vertical: defPadding * 1.2),
          decoration: BoxDecoration(
            color: third,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(
            'Add Record',
            style: TextStyle(
              fontSize: height * 0.02,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
