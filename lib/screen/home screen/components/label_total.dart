import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_database_tasks/utils.dart';

class LabelAndTotal extends StatelessWidget {
  const LabelAndTotal({
    super.key,
    required this.label,
    required this.total,
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
          style: GoogleFonts.varelaRound(
            fontSize: height * 0.015,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '\$ $total',
          style: GoogleFonts.varelaRound(
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
