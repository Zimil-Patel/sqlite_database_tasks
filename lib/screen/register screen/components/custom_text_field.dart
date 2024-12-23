import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';

Widget buildTextField({
  required IconData icon,
  required String hintText,
  TextInputType keyboardType = TextInputType.text,
  bool isObscure = false,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: defPadding / 1.5),
    child: TextField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      cursorColor: third,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
          fontSize: height * 0.015,
          color: Colors.white54,
        )),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: third),
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: third, width: 1.6),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),
  );
}
