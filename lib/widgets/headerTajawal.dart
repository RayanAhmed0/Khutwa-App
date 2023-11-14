import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight weight;
  const HeaderText(this.title, this.size, this.weight);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: GoogleFonts.tajawal(
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
