import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqlite_database_tasks/theme/theme_data.dart';
import 'package:sqlite_database_tasks/utils.dart';


SizedBox signUpButton() {
  return SizedBox(
    height: height * 0.054,
    child: CupertinoButton(
      borderRadius: BorderRadius.circular(14),
      padding: EdgeInsets.zero,
      color: third,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: defPadding,
          ),
          Text(
            'Sign up',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            width: defPadding,
          ),
           FaIcon(FontAwesomeIcons.arrowRight,
              color: Colors.white,
            size: height * 0.024,
          ),
        ],
      ),
    ),
  );
}