import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Row dividerWithORText() {
  return Row(
    children: [
      const Expanded(child: Divider(color: Colors.grey,)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text('OR', style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white54))),
      ),
      const Expanded(child: Divider(color: Colors.grey,)),
    ],
  );
}