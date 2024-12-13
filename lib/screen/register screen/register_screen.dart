import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_database_tasks/utils.dart';
import 'components/sign_up_fields.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: defPadding,
              right: defPadding,
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: defPadding * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      const SizedBox(
                        height: defPadding * 5,
                      ),

                      Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: height * 0.035,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: defPadding * 2,
                      ),

                      Text(
                        'Keep you expense tracked and organized Sign up to start using',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: height * 0.014,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w400,
                              color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                ),



                singUpFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
