import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqlite_database_tasks/utils.dart';

Widget appleButton() {
  return SizedBox(
    height: height * 0.06,
    width: width,
    child: CupertinoButton(
      borderRadius: BorderRadius.circular(14),
      padding: EdgeInsets.zero,
      color: Colors.black,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: defPadding),

          FaIcon(FontAwesomeIcons.apple,
            color: Colors.white,
            size: height * 0.038,
          ),

          const SizedBox(width: defPadding),

          Flexible(
            child: Text(
              'Continue with Apple',
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.015,
                  fontWeight: FontWeight.w400,

                ),
              ),
            ),
          ),

          const SizedBox(width: defPadding),
        ],
      ),
    ),
  );
}

Widget googleButton() {
  return SizedBox(
    height: height * 0.06,
    child: CupertinoButton(
      borderRadius: BorderRadius.circular(14),
      padding: EdgeInsets.zero,
      color: Colors.black,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: defPadding),
          SizedBox(
            height: height * 0.03,
            width: height * 0.03,
            child: Image.asset('assets/images/google.png'),
          ),

          const SizedBox(width: defPadding / 2),

          Flexible(
            child: Text(
              'Continue with Google',
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.015,
                  fontWeight: FontWeight.w400,

                ),
              ),
            ),
          ),
          const SizedBox(width: defPadding),
        ],
      ),
    ),
  );
}