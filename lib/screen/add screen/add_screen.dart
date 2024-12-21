import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/screen/register%20screen/components/custom_text_field.dart';
import 'package:sqlite_database_tasks/utils.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Record'),
      ),
      body: Hero(
        tag: 'addScreen',
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defPadding),
          child: Column(
            children: [
              // AMOUNT
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
          
              // CATEGORY
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // HEADING
                    Row(
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
          
                    // CATEGORY LIST ICONS
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
