import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis', style: GoogleFonts.varelaRound(),),
      ),
    );
  }
}
