import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/screen/register%20screen/components/custom_text_field.dart';
import 'package:sqlite_database_tasks/utils.dart';


  Padding buildAmountDesTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
              color: Colors.transparent,
              child: buildTextField(
                icon: Icons.attach_money_rounded,
                hintText: 'Enter Amount',
                keyboardType: TextInputType.number,
              )),

          // DESCRIPTION
          Material(
              color: Colors.transparent,
              child: buildTextField(
                icon: Icons.description_rounded,
                hintText: 'Enter Description',
              )),
        ],
      ),
    );
  }
