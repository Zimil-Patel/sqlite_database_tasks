import 'package:flutter/material.dart';
import 'package:sqlite_database_tasks/utils.dart';



class LabelAndTotal extends StatelessWidget {
  const LabelAndTotal({
    super.key, required this.label, required this.total,
  });

  final String label;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: height * 0.014,
            letterSpacing: 2,
            fontWeight: FontWeight.w100,
          ),
        ),

        Text(
          '\$ $total',
          style: TextStyle(
            fontSize: height * 0.02,
            letterSpacing: 1,
            height: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
